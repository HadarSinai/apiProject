
const user = sessionStorage.getItem('user')
const parseUser = JSON.parse(user)

window.onload = async () => {
    const user = document.getElementById("welcome");
    user.innerText = `welcome to ${parseUser.firstName}!!!`
}
const link = async () => {
    const userName = document.getElementById("userName");
    userName.value = parseUser.userName;
   /* const password = document.getElementById("password");*/
   /* password.value = parseUser.password;*/
    const firstName = document.getElementById("firstName");
    firstName.value = parseUser.firstName;
    const lastName = document.getElementById("lastName");
    lastName.value = parseUser.lastName;

        isFlagSet = true
        var myDiv = document.getElementById("input");
        if (isFlagSet) {
            myDiv.style.display = "block";
            }
        else {
            myDiv.style.display = "none";
    }

}



const enterStore = async()=>{
    window.location.href = "./product.html"

}


const updateDetailes = async () => {
    try {
        const userId = parseUser.userId;
        const userName = document.getElementById("userName").value;
        const password = document.getElementById("password").value;
        const firstName = document.getElementById("firstName").value;
        const lastName = document.getElementById("lastName").value;

       /* let res = checkPassword(userId);*/
      /*  if (res == true) {*/
        //userId = userId.trim();
        //userName = userName.trim();
        //password = password.trim();
        //firstName = firstName.trim();
        //lastName = lastName.trim();
        const user = { userId, userName, password, firstName, lastName };
        
        
        //}
        //else
       /* return (alert("try another password"))*/


        const responsePut = await fetch(`api/User/${userId}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(user)
        });
        console.log(responsePut);
        if (!responsePut.ok) {
            throw new Error("We could not update")
        }
        sessionStorage.setItem("user", JSON.stringify(responsePut))
        window.location.href = "./user.html"
    }
    catch (ex) {
        alert(ex)
    }
}







const checkPassword =  async (userId) => {
    try {
       
        const res = await fetch('api/User/postPassword', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(userId)
        });
        if (!res.ok) {
            throw new Error("try agian,The password is not strong enough")
            flag = true
            return false
        }
        flag = true;
        alert(`The password is strong`);
       return true

    }
    catch (ex) {
        alert(ex)
    }
}



