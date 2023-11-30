const password = document.getElementById('password');
const eyeOpen = document.querySelector('.eye-open');
const eyeClose = document.querySelector('.eye-close');
eyeOpen.addEventListener("click",function(){
	eyeOpen.classList.add("hidden");
	eyeClose.classList.remove("hidden");
	password.type="password";
	});
eyeClose.addEventListener("click",function(){
	eyeClose.classList.add("hidden");
	eyeOpen.classList.remove("hidden");
	password.type="text";
	 });
function toggleDropdown() {
        var dropdown = document.getElementById("myDropdown");
        dropdown.classList.toggle("show");
    }
    window.onclick = function(event) {
        if (!event.target.matches('.dropdown-content')) {
            var dropdowns = document.querySelector(".dropdown-content");
            for (var i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
    }