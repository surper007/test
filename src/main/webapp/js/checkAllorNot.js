function checkBoxAll() {
    var ch = document.getElementById("all");
    var chs = document.getElementsByName("box");
    for (var i = 0; i < chs.length; i++) {
        chs[i].checked = ch.checked;
    }
    if (ch.checked) {
        $(".all").css("background-color", "#abcdef");
    } else {
        $(".all").css("background-color", "");
    }
    cancel();
}
// $(function() {
//     $("#all").click(function() {
//         if($("#all").checked == "true"){
//         }
//     })
// })


function checkBoxOne() {
    checkedAll("one", "all");
}

function checkBoxTwo() {
    checkedAll("two", "all");
}

function checkBoxThree() {
    checkedAll("three", "all");
}

function checkedAll(chs, alls) {
    var ch = document.getElementById(chs);
    var all = document.getElementById(alls);
    var count = 0;
    if (!ch.checked) {
        all.checked = false;
        $(".all").css("background-color", "");
        cancel();
    } else {
        var arrs = [];
        var checs = document.getElementsByName("box");
        for (var i = 0; i < checs.length; i++) {
            if (checs[i].checked) {
                arrs[i] = ".Check" + i;
                $(arrs[i]).css("background-color", "#abcdef");
            } else {
                count++;
            }
        }
        if ((arrs.length - count) == checs.length) {
            all.checked = true;
            $(".all").css("background-color", "#abcdef");
        }
    }
}

function cancel() {
    var arrs = [];
    var checs = document.getElementsByName("box");
    for (var i = 0; i < checs.length; i++) {
        if (!(checs[i].checked)) {
            arrs[i] = ".Check" + i;
            $(arrs[i]).css("background-color", "");
        }
    }
}