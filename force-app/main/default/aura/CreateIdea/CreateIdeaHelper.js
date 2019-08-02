({
    createIdea : function(component, event) {
        if(this.validateData(component)){
            var action = component.get('c.postIdeaLightning');
            var titleComponent = component.find('titleInput');
            var statusComponent = component.find('statusInput');
            var descriptionComponent = component.find('Description');
            var categoriesComponent = component.find('Categories');
            var zoneComponent = component.find('zone');
            var cat = categoriesComponent.get('v.value');
            
            action.setParams({
                "Title" : titleComponent.get('v.value'),
                "Description" : descriptionComponent.get('v.value'),
                "Category" : cat.toString(),
                "ZoneId" : zoneComponent.get('v.value'),
                "status" : statusComponent.get('v.value')
            });
            action.setCallback(this, function(response){
                var state = response.getState();
                var result = response.getReturnValue();
                //alert(result.errorMessage);
                if(state === 'SUCCESS' && component.isValid() && result.isSuccess){
                    console.log('record successfully created');
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        //mode: 'sticky',
                        message: 'Record Successfully Created',
                        type:'success',
                        messageTemplate: 'Idea {0} created! See it {1}!',
                        messageTemplateData: ['Record', {
                            url: result.resultMessage.split('####')[0]+'/'+result.resultMessage.split('####')[1],
                            label: 'here',
                        }]
                    });
                    var appEvent = $A.get("e.c:CreateIdeaEvent");
                    appEvent.fire();
                    toastEvent.fire();
                }else if(state === 'ERROR'){
                    console.log(response.error);
                }else{
                    console.log('UNKNOWN ERROR');
                }
            });
            $A.enqueueAction(action);
        }
    },
    validateData : function(component){
        var isValid = true;
        var titleComponent = component.find('titleInput');
        var zoneComponent = component.find('zone');
        
        if(zoneComponent.get('v.value')==undefined || zoneComponent.get('v.value')==''){
            isValid = false;
            component.set('v.hasError',true);
            zoneComponent.set('v.errors',[{message:"Idea Community is Mandatory to Select!"}]);
        }else{
            zoneComponent.set('v.errors',null);
            component.set('v.hasError',false);
        }
        
        if(titleComponent.get('v.value')==undefined || titleComponent.get('v.value')==''){
            isValid = false;
            component.set('v.hasError',true);
            titleComponent.set('v.errors',[{message:"Title Can not be empty"}]);
        }else{
            titleComponent.set('v.errors',null);
            component.set('v.hasError',false);
        }
        
        
        return isValid;
    },
    setCommunity : function(component){
        var action = component.get('c.CommunityForIdeas');
        action.setCallback(this, function(response){
            var state = response.getState();
            var zoneComponent = component.find('zone');
            if(state === 'SUCCESS' && component.isValid()){
                var selectOptns =[];
                var result = response.getReturnValue();
                for(var i = 0; i <result.length; i++){
                    selectOptns.push({label:result[i].split('####')[1],value:result[i].split('####')[0]});
                }
                zoneComponent.set('v.options',selectOptns);
            }else if(state === 'ERROR'){
                console.log(reposne.error);
            }else{
                console.log('Unknown Error');
            }
        });
        $A.enqueueAction(action);
    },
    setCategory : function(component){
        var action = component.get('c.categoryPickList');
        action.setCallback(this, function(response){
            var state = response.getState();
            var categoriesComponent = component.find('Categories');
            if(state === 'SUCCESS' && component.isValid()){
                var selectOptns =[];
                var result = response.getReturnValue();
                for(var i = 0; i <result.length; i++){
                    selectOptns.push({
                        label:result[i].split('####')[0],
                        value:result[i].split('####')[1]
                    });
                }
                //alert(selectOptns);
                component.set('v.optionValue',selectOptns);
                console.log('Test');
                console.log(categoriesComponent.get('v.options'));
            }else if(state === 'ERROR'){
                console.log(reposne.error);
            }else{
                console.log('Unknown Error');
            }
        });
        $A.enqueueAction(action);
    },
    setStatus : function(component){
        var action = component.get('c.statusPickList');
        action.setCallback(this, function(response){
            var state = response.getState();
            var statusComponent = component.find('statusInput');
            if(state === 'SUCCESS' && component.isValid()){
                var selectOptns =[];
                var result = response.getReturnValue();
                for(var i = 0; i <result.length; i++){
                    selectOptns.push({label:result[i].split('####')[0],value:result[i].split('####')[1]});
                }
                statusComponent.set('v.options',selectOptns);
            }else if(state === 'ERROR'){
                console.log(reposne.error);
            }else{
                console.log('Unknown Error');
            }
        });
        $A.enqueueAction(action);
    }
})