({
    doInit : function(component, event, helper) {
        
        component.find('recordCreator').getNewRecord(
                            'Address_Book__c',
                            null,
                            false,
                            $A.getCallback(function(){
                                var record = component.get('v.record');
                                var error = component.get('v.recordError');
                                if(error || (record === null)){
                                    console.log(' Error while creating the template ',error);
                                }else{
                                    console.log(' Successfuly Created');
                                    //alert('Templated Initiated');
                                }
                            })
                        );
        
        var pageReference = component.get('v.pageReference');
        console.log(pageReference);
        if(pageReference){
            var state = pageReference.state;
            console.log(state);
            console.log('state.cartId', state.cartId);
            if(state.cartId){
                console.log(' CartId ' ,state.cartId);
                component.set('v.CartId',state.cartId );
                var action = component.get('c.getCartItems');
                action.setParams({
                    'CartId' : state.cartId
                });
                action.setCallback(this, function(response){
                    var stateResponse = response.getState();
                    if(stateResponse === 'SUCCESS' || stateResponse === 'DRAFT'){
                        var resultData = response.getReturnValue();
                        console.log(' resultData ' , resultData.length);
                        var items = [];
                        var subTotal;
                        for(var key in resultData){
                            items.push(resultData[key]);
                            if(subTotal)
                                subTotal = subTotal + resultData[key].Total_Amount__c
                            else
                                subTotal = resultData[key].Total_Amount__c
                        }
                        component.set('v.subTotal', subTotal);
                        /*
                         * for(String item : resultData.keySet())
                         * 		CartItem__C = resultData.get(item);
                         * 
                         */ 
                        component.set('v.cartItemList', items);
                    }else if(stateResponse === 'INCOMPLETE'){
                        console.log('User is offline System does not support offline');
                    }else if(stateResponse ==='ERROR'){
                        var errors = response.getError();
                        if(errors || errors[0].pageMessage){
                            console.log(' page Error ', errors[0].pageMessage);
                        }
                        if(errors || errors[0].duplicateResults){
                            console.log(' duplicate Error ', errors[0].duplicateResults);
                        }
                    }else{
                        
                    }
                });
                $A.enqueueAction(action);
            }
        }
    },
    
    homePage : function(component, event, helper){
        var pageReference = component.find("navigation");
        var pageReferenceNav = {    
            "type": "standard__navItemPage",
            "attributes": {
                "apiName": "Beer_Explorer"    
            }
        };
        pageReference.navigate(pageReferenceNav, true);
    },
    applyCoupon : function(component, event, helper){
        component.set('v.isCouponAplied', true);
    },
    doApplyCoupon : function(component, event, helper){
        var CouponNo = component.find('CouponNo').get('v.value');
        var cartId = component.get('v.CartId');
        if(CouponNo){
            var action = component.get('c.checkCoupon');
            action.setParams({
                Name : CouponNo,
                CartId : cartId
            });
            action.setCallback(this, function(response){
                var state = response.getState();
                //alert(state);
                if(state === 'SUCCESS' || state ==='DRAFT'){
                    var resultData = response.getReturnValue();
                    if(resultData){
                        component.set('v.discountAmount', resultData);
                        component.set('v.errorDiscount',null);
                        component.set('v.isCouponSuccess', true);
                    }else{
                        component.set('v.errorDiscount','Coupon is not Valid OR Expired.');
                        component.set('v.discountAmount',null);
                         component.set('v.isCouponSuccess', false);
                    }
                }
            });
            $A.enqueueAction(action);
        }else{
            alert('Please Enter your Coupon No');
        }
    },
    doCheckout : function(component, event, helper){
        component.set('v.isCheckout', true);
    },
    doSaveAddress : function(component, event, helper){
        var isValidAddress = helper.validate(component, event, helper);
        //alert(isValidAddress);
        if(isValidAddress){
            var userId = $A.get("$SObjectType.CurrentUser.Id");
            component.set('v.addressBook.User__c',userId);
            component.find('recordCreator').saveRecord(function(saveResult){
                if(saveResult.state === 'SUCCESS' || saveResult.state === 'DRAFT'){
                    var showToast = $A.get('e.force:showToast');
                    showToast.setParams({
                        "title" : "Record Saved",
                        "type" : "success",
                        "message" : "AddressBook Has been Save with the Record Id "+saveResult.recordId
                    });
                    showToast.fire();
                    var addList = [];
                    var addrList = component.get('v.addressList');
                    if(addrList){
                        addrList.push(component.get('v.addressBook'));
                        component.set('v.addressList' , addrList);
                    }else{
                       addList.push(component.get('v.addressBook'));
                       component.set('v.addressList' , addList); 
                    }
                    component.set('v.isNewAddress', false);
                } else if(saveResult.state === 'INCOMPLETE'){
                    
                }else if(saveResult.state === 'ERROR'){
                    
                }else{
                    
                }
            });
        }
    },
    getAddress : function(component, event, helper){
        var isTrue = component.get('v.isCheckout');
        if(isTrue){
            helper.fetchAddress(component, event, helper);
        }
    },
    onSelect : function(component, event, helper){
        var selected = event.getSource().get("v.text");
        var cehcked =  event.getSource().get("v.value");
        var allAddress = component.get('v.addressList');
        var selecedAddress = allAddress[selected];
        console.log('selecedAddress ', selecedAddress);
        component.set('v.selectedAddress', selecedAddress);
    },
    placeOrder : function(component, event, helper){
        var selectedAdd = component.get('v.selectedAddress');
        if(selectedAdd){
            //alert(selectedAdd.Id);
            //alert(component.get('v.CartId'));
            var userId = $A.get("$SObjectType.CurrentUser.Id");
            //alert(userId);
            var action = component.get('c.createOrder');
            action.setParams({
                addressId : selectedAdd.Id,
                cartId : component.get('v.CartId'),
                UserId : userId,
                subTotal : component.get('v.subTotal')
            });
            
            action.setCallback(this, function(response){
                var state = response.getState();
                if(state === 'SUCCESS' || state === 'DRAFT'){
                    var showToast = $A.get('e.force:showToast');
                    var resustData = response.getReturnValue();
                    showToast.setParams({
                        "title" : "Record Saved",
                        "type" : "success",
                        "message" : "Your Order Has been Successfully Placed." +
                        "Your tracking Order no is "+resustData.split('####')[0]
                    });
                    showToast.fire();
                    var pageReference = component.find("navigation");
                    var pageReferenceNav = {    
                        "type": "standard__recordPage",
                        "attributes": {
                            "recordId": resustData.split('####')[1],
                            "objectApiName": "Order__c",
                            "actionName": "view"   
                        }
                    };
                    pageReference.navigate(pageReferenceNav, true);
                } else if(state === 'INCOMPLETE'){
                    console.log('User is offline and System does not support offline!.');
                }else if(state === 'ERROR'){
                    var errors = response.getError();
                    console.log('Error Occured ', errors);
                }else{
                    
                }
            });
            $A.enqueueAction(action);
        }else{
            alert('Please Select Address');
        }
    },
    addNewAddress : function(component, event, helper){
        
        component.set('v.isNewAddress', true);
    }
})