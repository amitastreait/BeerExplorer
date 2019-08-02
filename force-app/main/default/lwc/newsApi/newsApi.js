import { LightningElement, track, wire } from 'lwc';
import  fetchHeadlines from '@salesforce/apex/NewsAPI.fetchHeadlines';

import userId from '@salesforce/user/Id';

import fetchNews from '@salesforce/apex/NewsAPI.fetchNews';

export default class NewsApi extends LightningElement {

    @track countryCode = 'in';
    @track queryParams = 'blockchain';
    @track headlines;
    @track error;
    @track Id = userId
    /* eslint-disable */

    @wire(fetchHeadlines,{
        Country : '$countryCode'
    })
    wiredHeadlines({ error, data }){
        if(data){
            this.headlines = JSON.parse(data);
            this.error = undefined;
            //console.log(' Top Headlined ',this.totalResults);
        }
        if(error){
            this.error = error;
            this.data = undefined
            console.log(' Error While Fetching the Top Headlines ',error);
        }
    }

    valueChange(event){
        event.preventDefault();
        this.queryParams = event.target.value;
        
    }
    searchNews(){
        fetchNews({
            queryParam : this.queryParams
        })
        .then( (data) => {
            //console.log(' Top Headlined ',data);
            this.headlines = JSON.parse(data);
            this.error = undefined;
            console.log(' Top Headlined ',this.headlines);
        })
        .catch( (error) =>{
            this.error = error;
            this.data = undefined
            console.log(' Error While Fetching the Top Headlines ',error);
        });
    }

    fetchMethodTest(){
        fetch('https://newsapi.org/v2/top-headlines?country='+ this.countryCode, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                'X-Api-Key' : 'f05f7785354b4360bc51da8ca08e3cd2'
            },
            /*body: JSON.stringify({
                amountOfRecords,
                recordMetadata,
            }),*/
        }).then(response => {
            let responseData = response.json();
            console.table(' responseData ', responseData);
        });
    }
}