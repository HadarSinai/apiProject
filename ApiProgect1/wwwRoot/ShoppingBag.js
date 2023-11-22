window.onload = () => {

    send();
   
}


const send = async () => {
    const data = await sessionStorage.getItems("ProductsCart");
    console.log("arr"-data)
    let cart =await JSON.parse(data);
    for (var i = 2; i < cart.length; i++) {

        showCard(data[i])
        
    }
    
}
const showCard = (data) => {
    let div = document.getElementById("showCart")
 
    let temp = document.getElementById("temp-row")
    let clone = temp.content.cloneNode(true)
   clone.querySelector("img").src = "./potos/" + data.productImage
    clone.querySelector("h3.itemName").innerText = data.productName
    alert("good- luck")
    console.log(data)
    //clone.querySelector("p.price").innerText = data.productPrice + "$"
    //clone.querySelector("p.description").innerText = data.productDescription
    div.appendChild(clone)
}