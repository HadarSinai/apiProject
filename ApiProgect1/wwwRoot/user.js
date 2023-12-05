

//לאפשר user
//למחוק לפי id
const login = async () => {
    try {
      
        const userNameLogin = document.getElementById("id").value;
            const passwordLogin = document.getElementById("pass").value;
        const login = { userNameLogin, passwordLogin };
            const res = await fetch('api/User/login',{ 
            method: 'POST',
                headers: {
                'Content-Type': 'application/json'
            },
           
                body: JSON.stringify(login)
        });
        
        if (!res.ok) {
            
            throw new Error("we  couldn't find your details")
        }
        
        const dataJson = await res.json()
        sessionStorage.setItem("user", JSON.stringify(dataJson))
        window.location.href = "./update.html"
    }
    catch (ex) {
        console.log(ex)
        alert(ex)
        
    }
}





const link = async () => {

        isFlagSet = true
        let myDiv = document.getElementById("input");
        if (isFlagSet) {
            myDiv.style.display = "block";

        } else {
            myDiv.style.display = "none";
        }



}
let flag = false;

const checkPassword = async () => {
    try { 
    const password = document.getElementById("password").value;
        const res = await fetch('api/User/postPassword', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(password)
    });
        if (!res.ok) {
            throw new Error("try agian,The password is not strong enough")
flag=true}
        
   // const data = await res.json()
        flag = true;
        alert(`The password is strong `);
        //${data}
   
    }
    catch (ex) {
    alert(ex)
    }
}



    const register = async ()=> {

        try {
            
        const userName = document.getElementById("userName").value;
        const password = document.getElementById("password").value;
        const firstName = document.getElementById("firstName").value;
        const lastName = document.getElementById("lastName").value;

            const user = { userName, password, firstName, lastName}

            const res = await fetch('api/User/post', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(user)
            });
            console.log("uuuuuuuuuuuuuuu");
            if (!res.ok) {
                console.log(res)
                throw new Error("try agian,we cant saved the user")
            }
            if (!flag)
                throw new Error("try another password")
            const data = await res.json()
            alert(`${data.userName} was added`);
           
                sessionStorage.setItem("user", JSON.stringify(data))
                     window.location.href = "./update.html"

        }
        catch (ex) {
            console.log(ex)
            alert(ex)
           
        }

    }




