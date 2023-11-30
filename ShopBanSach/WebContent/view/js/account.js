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
	//validation
	const fullname = document.querySelector("#fullname");
	const email = document.querySelector("#email");
	const address = document.querySelector("#address");
	const phone = document.querySelector("#phone");
	const username = document.querySelector("#username");
	function showErrror(input, message){
		const error = input.parentElement.querySelector("small");
		
		error.innerText=message;
		input.style.border = "1px solid red";
		}
	function successForm(input){
		const error = input.parentElement.querySelector("small");
  		error.innerText='';
		input.style.border = "1px solid black";
	}
	function checkEmptyInput(listinput){
		let isEmptyError = false;
		for(let i = 0; i< listinput.length ;i++){
			let input = listinput[i];
			input.value = input.value.trim();
			if(input.value==''){
				showErrror(input,"Không được bỏ trống");
				isEmptyError = true;
			}
			else{
				successForm(input);
			}
		}
		return isEmptyError;
	}
	function checkFullName(){
		let pattern =  /^[a-zA-ZÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÒÓÔÕÖØÙÚÛÜÝàáâãäåæçèéêëìíîïòóôõöøùúûüý-]+(\s+[a-zA-ZÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÒÓÔÕÖØÙÚÛÜÝàáâãäåæçèéêëìíîïòóôõöøùúûüý-]+)*$/;
		let inputFullname = fullname.value.trim();
		let checksucess = pattern.test(inputFullname);
		if(pattern.test(inputFullname)){
			successForm(fullname);
		}else{
			showErrror(fullname,'Tên không hợp lệ');	
		}
		return checksucess;
	}
	function validationForm(){
		 let listinput = [username,password,re_password,fullname,email,address,phone];

		 if(checkEmptyInput(listinput)){
		 	return false;
		 }else{
		 	if(!checkFullName()) return false;
		 }
		return true;
	}
	