var message = document.querySelector(".modal")

var closebox = document.querySelector(".close")

var submitButton = document.querySelector(".submit")


function display() {
  message.style.display =  'block'
};

var timeoutShow = setTimeout(display, 3000);


closebox.addEventListener('click', function(){
  message.style.display =  'none';
  clearTimeout(timeoutShow);
})