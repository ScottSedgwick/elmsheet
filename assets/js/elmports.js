function setup_ports()
{
    app.ports.save.subscribe(function(keyValue) {
        console.log("Saving stuff");
        const obj = JSON.parse(keyValue);
        localStorage.setItem("character_" + obj.key, obj.value);
    });

    app.ports.doload.subscribe(function(key) {
        console.log("Loading stuff");
        const value = localStorage.getItem("character_" + key);
        console.log(value);
        app.ports.load.send(value);
    });

    app.ports.dolist.subscribe(function() {
        console.log("Listing items");
        var items = [];
        const len = localStorage.length;
        for (var i=0; i<len; i++) {
            const key = localStorage.key(i);
            if (key.startsWith("character_")) {
            items.push(key.slice(10));
            }
        }
        console.log(items);
        app.ports.listChars.send(JSON.stringify(items));
    });

    app.ports.updatetitle.subscribe(function(value) {
        document.title = value;
    });
}