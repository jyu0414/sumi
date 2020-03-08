const TouchEventHandler = (e,kind) => {
    const event = {
        time: (new Date()).getTime(),
        touches: [],
        event: kind
    };
    for(const touch of e.touches) {
        const touchData = {
            identifier: touch.identifier,
            screen: {
                x: touch.screenX,
                y: touch.screenY
            },
            client: {
                x: touch.clientX,
                y: touch.clientY
            },
            page: {
                x: touch.pageX,
                y: touch.pageY
            },
            target: touch.target
        };
        event.touches.push(touchData);
    }
    window.webkit.messageHandlers.touchHandler.postMessage(JSON.stringify(event));
};
var move;

const TouchesStartHandler = (e) => {
    TouchEventHandler(e,'start');
};

const TouchesEndHandler = (e) => {
    if(move) { TouchEventHandler(move,'move'); };
    move = null;
    TouchEventHandler(e,'end');
};

const TouchesMoveHandler = (e) => {
    move = e;
    //データが多すぎるのでとらない
    //TouchEventHandler(e,'move');
};

document.addEventListener('touchstart',TouchesStartHandler);
document.addEventListener('touchend',TouchesEndHandler);
document.addEventListener('touchmove',TouchesMoveHandler);
