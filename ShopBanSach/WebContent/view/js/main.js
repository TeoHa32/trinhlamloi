function amount(){
    var num_input = document.querySelector(".product_detail-amount-num");
    var num = Number(num_input.value)
    var plus =  document.querySelector(".fa-plus").addEventListener("click", function(){
        num += 1
        if(num > 10 )
            num = 10
        num_input.value = num

    });

    var minus =  document.querySelector(".fa-minus").addEventListener("click", function(){
        num -= 1
        if(num < 1 )
            num = 1
        num_input.value = num
    });
}

function sortByPrice(){
    var low_to_high = document.querySelector(".sort_low-to-high");
    var high_to_low = document.querySelector(".sort_high-to-low");
    var checks = document.getElementsByClassName("fa-check")

    low_to_high.addEventListener("click", function(){
        checks[0].classList.add("fa-check-show")
        checks[1].classList.remove("fa-check-show")
    })

    high_to_low.addEventListener("click", function(){
        checks[1].classList.add("fa-check-show")
        checks[0].classList.remove("fa-check-show")
    })
    
    
}
