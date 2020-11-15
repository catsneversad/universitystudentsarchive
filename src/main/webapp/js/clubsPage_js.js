$(document).ready(function() {
    $('#btn_add').click(function(){
        if(NameValid() && DescriptionValid() && ImageValid()) {
            name = $("#name").val();
            description = $("#description").val();
            image = $("#image").val();
            if (!name || !description || !image) {
                alert('Please, fill all fields');
                return;
            }
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4) {
                    var response = JSON.parse(this.responseText).message;
                    alert(response)
                    location.reload();
                }
            };
            xhttp.open("PUT", "http://localhost:8090/My_RESTful_Service_war/api/reader", true);
            xhttp.setRequestHeader('Content-type', 'application/json');
            xhttp.send(JSON.stringify({
                name: name,
                description: description,
                image: image
            }));
        }
    });

    $('#btn_change').click(function(){
        if(NameValid() && DescriptionValid() && ImageValid()) {
            name = $("#name").val();
            description = $("#description").val();
            image = $("#image").val();
            if (!name || !description || !image) {
                alert('Please, fill all fields');
                return;
            }
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function ()
            {
                if (this.readyState == 4){
                    var response = JSON.parse(this.responseText).message;
                    alert(response)
                    if (this.status == 200)
                        location.reload();
                    if(this.status == 400)
                        alert("Client error");
                    if(this.status == 500)
                        alert("Server error");
                }
            };
            xhttp.open("PUT", "http://localhost:8090/My_RESTful_Service_war/api/reader/updateClub", true);
            xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            xhttp.send("club_name=" + name + "&club_description=" + description + "&club_image" + image);
        }
    });


    //Description Valid
    var DescriptionValid = function(){
        description = $('#description').val();
        if(description.length < 10){
            $('#regisErr3').text('* Description should not be short!');
            $('#description').focus();
            return false;
        }
        if (description == '') {
            $('#regisErr3').text('* This field is required !');
            $('#description').focus();
            return false;
        }else{
            $('#regisErr3').removeClass('error').text('');
            return true;
        }
    };

    //Name Vaildation
    var NameValid = function(){
        name = $('#name').val();
        if (name == '') {
            $('#regisErr2').text('* This field is required !');
            $('#name').focus();
            return false;
        }else{
            $('#regisErr2').removeClass('error').text('');
            return true;
        }
    };

    //Image Vaildation
    var ImageValid = function(){
        image = $('#image').val();
        if (image == '' && image.length > 6) {
            $('#regisErr1').text('* This field is required !');
            $('#copies').focus();
            return false;
        }else{
            $('#regisErr1').removeClass('error').text('');
            return true;
        }
    };


    $("#name").keyup(function(){
        NameValid();
    });
    $("#description").keyup(function(){
        DescriptionValid();
    });
    $("#image").keyup(function(){
        ImageValid();
    });

});
