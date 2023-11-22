
window.onload = async () => {
   
    getCategory();
    filterProducts();
   
}

const getProducts = async (desc, minPrice, maxPrice, categoryIds) => {
    document.getElementById("prod").replaceChildren([]);
    
   

        let url = `https://localhost:44355/api/Product`;
        if (desc || minPrice || maxPrice || categoryIds) url += `?`
        if (desc) url += `&desc=${desc}`;
        if (minPrice) url += `&minPrice=${minPrice}`;
        if (maxPrice) url += `&maxPrice=${maxPrice}`;
        if (categoryIds) {
            for (let i = 0; i < categoryIds.length; i++) {
                url += `&categoryIds=${categoryIds[i]}`
            }
        }


        try {
            const res = await fetch(url)
            if (!res.ok) {
                throw new Error("we  couldn't load  the products")
            }
            const data = await res.json()
            for (var i = 0; i < data.length; i++) {
                console.log(data[i])
                showCard(data[i])
                return data;
            }
        }
        catch (ex) {
            console.log(ex)
            alert(ex)

        }
    }



    const getCategory = async () => {
        try {

            const res = await fetch("api/Category")
            if (!res.ok) {
                throw new Error("we  couldn't load  the caterorys")
            }
            const data = await res.json()

            for (var j = 0; j < data.length; j++) {
                showCategory(data[j]);
            }
        }
        catch (ex) {
            alert(ex)
        }
    }
    


const showCategory = async (category) => {
    let div = document.getElementById("categoryList")
    let temp = document.getElementById("temp-category")
    let clone = temp.content.cloneNode(true)
    clone.querySelector("span.OptionName").innerText = category.categoryName
    div.appendChild(clone)
}


const showCard = async (data) => {
    let div = document.getElementById("prod")
    document.body.appendChild(div);
    let temp = document.getElementById("temp-card")
    let clone = temp.content.cloneNode(true)
    clone.querySelector("img").src = "./potos" + data.productImage
        clone.querySelector("h1").innerText = data.productName
        clone.querySelector("p.price").innerText = data.productPrice+ "$"
    clone.querySelector("p.description").innerText = data.productDescription
    clone.querySelector("button").addEventListener('click', () => { addToCart(data) })
 //
 //
 
        div.appendChild(clone)
    
}

const filterProducts = async () => {
    let checkedCategories = [];
    const allCategoriesOptions = document.querySelectorAll(".opt");

        for (let i = 0; i < allCategoriesOptions.length; i++) {
            if (allCategoriesOptions[i].checked)
                checkedCategories.push(allCategoriesOptions[i].id)
        }
    let minPrice = document.getElementById("minPrice").value;
    let maxPrice = document.getElementById("maxPrice").value;
        let desc = document.getElementById("nameSearch").value;
    const products = await getProducts(desc, minPrice, maxPrice, checkedCategories);
    /*document.getElementById("prod").replaceChildren([]);*/
        for (var i = 0; i < products.length; i++) {
            let tmp = document.getElementById("temp-card");
            let clone = tmp.content.cloneNode(true);
            clone.querySelector("img").src = "./potos/" + products[i].productImage;
            clone.querySelector("h1").innerText = products[i].productName;
            clone.querySelector(".description").innerText = products[i].productDescription
            clone.querySelector(".price").innerText = products[i].productPrice + "$";
            document.getElementById("prod").appendChild(clone);
    }


}

let arrayCart = [];

const addToCart =  (product) => {
    arrayCart.push(product);
    //document.getElementById("ItemsCountText").innerText = arrayCart.length
     sessionStorage.setItem("ProductsCart", JSON.stringify(arrayCart));
    alert("נוסף בהצלחה לסל")
    console.log(arrayCart)
}

