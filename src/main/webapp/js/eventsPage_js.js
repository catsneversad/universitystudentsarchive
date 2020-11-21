$(document).ready(function() {
    $('#btn_add').click(function(){
        if(NameValid() && DescriptionValid() && ImageValid()) {
            name = $("#name").val();
            description = $("#description").val();
            image = $("#image").val();
            club = $("#club").val();
            major = $("#major").val();
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4) {
                    var response = JSON.parse(this.responseText).message;
                    alert(response)
                    location.reload();
                }
            };

            alert (JSON.stringify({
                name: name,
                description: description,
                image: image,
                major:{
                    id: club
                },
                club: {
                    id: major
                }
            }));

            xhttp.open("POST", "http://localhost:8080/finalproj_war_exploded/api/events", true);
            xhttp.setRequestHeader('Content-type', 'application/json');
            xhttp.send(JSON.stringify({
                name: name,
                description: description,
                image: image,
                major:{
                    id: club
                },
                club: {
                    id: major
                }
            }));
        }
    });


    $('#btn_find').click(function(){
        jQuery.ajax({
            url: "http://localhost:8080/finalproj_war_exploded/api/events",
            type: "GET",
            contentType: 'application/json; charset=utf-8',
            success: function (resultData) {
                events = resultData;
                displayEvents(events)
            },
            error: function (jqXHR, textStatus, errorThrown) {alert("GG");

            },
            timeout: 120000,
        });
    });


    $('#btn_find').click(function(){
        jQuery.ajax({
            url: "http://localhost:8080/finalproj_war_exploded/api/events",
            type: "GET",
            contentType: 'application/json; charset=utf-8',
            success: function (resultData) {
                events = resultData;
                displayEvents(events)
            },
            error: function (jqXHR, textStatus, errorThrown) {alert("GG");

            },
            timeout: 120000,
        });
    });


        let events = [];
        jQuery.ajax({
                url: "http://localhost:8080/finalproj_war_exploded/api/events",
                type: "GET",
                contentType: 'application/json; charset=utf-8',
                success: function (resultData) {
                    events = resultData;
                    displayEvents(events)
                },
                error: function (jqXHR, textStatus, errorThrown) {alert("GG");

                },
                timeout: 120000,
            });

    const displayEvents = (characters) => {
        id = 0;
        path = $('#path').val();
        const htmlString = characters
            .map((character) => {
                return `
                <tr>
                        <td>${character.name}
                        </td>
                        <td>${character.description}
                        </td>
                         <td>${character.club.name}
                        </td>
                         <td>${character.major.name}
                        </td>
                        <td>
                        <form action="/finalproj_war_exploded/event" method="get">
                            <input type="text" name="id" style="display: none"
                                   id="id${character.id}"
                                   value="${character.id}">
                            <button class="btn btn-info mt-2" id="edit${character.id}">Edit
                                event
                            </button>
                        </form>
                        </td>
                </tr>
        `;
            })
            .join('');
        tbody.innerHTML = htmlString;
    };

    $('#btn_change').click(function(){
        // alert("gg");
        if(NameValid() && DescriptionValid() && ImageValid()) {
            name = $("#name").val();
            description = $("#description").val();
            image = $("#image").val();
            id = $("#id").val();
            majorId = $("#major").val();
            clubId = $("#club").val();
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function ()
            {
                if (this.readyState == 4){
                    var response = JSON.parse(this.responseText).message;
                    alert(response)
                }
            };

            xhttp.open("PUT", "http://localhost:8080/finalproj_war_exploded/api/events", true);
            xhttp.setRequestHeader('Content-type', 'application/json');
            xhttp.send(JSON.stringify({
                id: id,
                name: name,
                description: description,
                image: image,
                major:{
                    id: majorId
                },
                club: {
                    id: clubId
                }
            }));
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
