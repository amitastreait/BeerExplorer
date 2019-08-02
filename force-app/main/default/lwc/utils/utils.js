import { ShowToastEvent } from 'lightning/platformShowToastEvent';
const showToast = (mode='dismissable',variant='info ',title, message) => {
    const event = new ShowToastEvent({
        mode : mode,
        variant : variant,
        title : title,
        message : message
    });
    return event;
}

export { showToast }