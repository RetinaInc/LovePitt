function SetSession(status){
    document.getElementById("SessionSet").value = status;
}

function Session(status){
    document.getElementById("Session").value = status;
}

function SetPostID(value){
    document.getElementById("postid").value = value;
}

function SetFriendID(value){
    document.getElementById("userid").value = value;
}

function showLogin(){
    if(document.getElementById('formLogin').style.display = 'none')
       {
        document.getElementById('formLogin').style.display = 'block';
       } 
}

function closeLogin(){
    document.getElementById('formLogin').style.display = 'none';
}

function changeColor(){
    document.getElementById('imgClose').src = "Img/index_close1.png";
}

function changeBack(){
    document.getElementById('imgClose').src = "Img/index_close.png";
}

