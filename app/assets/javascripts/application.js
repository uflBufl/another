// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require bootstrap
//= require turbolinks
//= require_tree .

// alert("123213213");
// animateText("textExample");


// document.addEventListener("DOMContentLoaded", () =>{animateText("value");});

// window.onload = function() {
//     alert("123213");
//     // animateText("textExample");
// };

function sound() {
    let audio = new Audio(); // Создаём новый элемент Audio
    audio.src = 'The_XX_-_Intro.mp3'; // Указываем путь к звуку "клика"
    // audio.play();
    audio.autoplay = true; // Автоматически запускаем
    // alert("asdsadsad")
}

async function animateText(textArea123) {
    // alert("123213");
    // alert(document.getElementById(textArea123).value);

    // textArea = document.getElementById(textArea123);

    let text = document.getElementById(textArea123).innerHTML;
    // document.getElementById(textArea123).textContent = "12321321";
    let to = text.length,
        from = 0;

    animate({
        duration: 5000,
        timing: linear,
        draw: function(progress) {
            // alert("321");
            let result = (to - from) * progress + from;
            document.getElementById(textArea123).innerHTML = text.substr(0, Math.ceil(result))
        }
    });
}

// function messageStart(id) {
//     // animateText("value");
//     animateText("value"+id);
// }

function bounce(timeFraction) {
    for (let a = 0, b = 1, result; 1; a += b, b /= 2) {
        if (timeFraction >= (7 - 4 * a) / 11) {
            return -Math.pow((11 - 6 * a - 11 * timeFraction) / 4, 2) + Math.pow(b, 2)
        }
    }
}

function linear(timeFraction) {
    return timeFraction;
}


function animate({timing, draw, duration}) {

    let start = performance.now();

    requestAnimationFrame(function animate(time) {
        // timeFraction изменяется от 0 до 1
        let timeFraction = (time - start) / duration;
        if (timeFraction > 1) timeFraction = 1;

        // вычисление текущего состояния анимации
        let progress = timing(timeFraction);

        draw(progress); // отрисовать её

        if (timeFraction < 1) {
            requestAnimationFrame(animate);
        }

    });
}


function f() {
    // alert("ffff");
    animateText("textExample");
}

function show(str, disp) {
    if ((str == "navb" && document.documentElement.clientWidth < '767') || (str == "comment")) {
        var x = document.getElementById(str);
        if (x.style.display == disp) {
            x.style.display = "none"
            // x.style.display = "inline"
        } else {
            x.style.display = disp
            // x.style.display = "none"
        }
    }
    // x.style.display = "none";
    // x.style.fontSize = "16px";
    // x.style.color = "red";
}

// window.onload(document.getElementById("textExample")){
//     f();
// }

// animateTextCS(sss);