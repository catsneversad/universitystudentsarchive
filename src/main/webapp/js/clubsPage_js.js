$(document).ready(function() {
    var url_string = (window.location.href).toLowerCase();
    var url = new URL(url_string);
    var id_get = url.searchParams.get("id");
    var xhttp = new XMLHttpRequest();
    jQuery.ajax({
        url: "http://localhost:8080/finalproj_war_exploded/api/clubs/"+id_get,
        type: "GET",
        contentType: 'application/json; charset=utf-8',
        success: function (resultData) {
            club = resultData;

            $("#name1").val(club.name);
            $("#image1").val(club.image);
            $("#club_img").attr("src", club.image);
            $("#description1").val(club.description);
            $("#hide_id_club").val(club.id);
            $("#club_date_hidden").val(club.created_at);
            $("#club_id_hidden").val(club.id);
        },
        error: function (jqXHR, textStatus, errorThrown) {
        },
        timeout: 120000,
    });

    $('#remove').click(function(){
            club_id = $("#club_id_hidden").val();
            student_id = $("#student_id").val();
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function ()
            {
                if (this.readyState == 4){
                    var response = JSON.parse(this.responseText).message;
                    alert(response);
                    location.reload();
                }
            };
            xhttp.open(" POST", "http://localhost:8080/finalproj_war_exploded/api/clubs/leave", true);
            xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            xhttp.send("club_id=" + club_id + "&student_id=" + student_id);
    });

    $('#btn_add').click(function(){
        if(NameValid() && DescriptionValid() && ImageValid()) {
            alert ("MAL");
            // id = $("#club_id_hidden").val();
            name = $("#name").val();
            description = $("#description").val();
            image = $("#image").val();
            // owner = $("#owner").val();
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4) {
                    var response = JSON.parse(this.responseText).message;
                    alert(response)
                    location.reload();
                }
            };
            xhttp.open("POST", "http://localhost:8080/finalproj_war_exploded/api/clubs", true);
            xhttp.setRequestHeader('Content-type', 'application/json');
            xhttp.send(JSON.stringify({
                // id: id,
                name: name,
                description: description,
                image: image,
                // owner: owner
            }));
        }
    });

    $('#btn_change').click(function(){
            id = $("#club_id_hidden").val();
            name = $("#name1").val();
            description = $("#description1").val();
            image = $("#image1").val();
            date = $("#club_date_hidden").val();
            if (!name || !description || !image) {
                alert('Please, fill all fields');
                return;
            }
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4) {
                    var response = JSON.parse(this.responseText).message;
                    alert(response)
                    location.reload();
                }
            };
            xhttp.open("PUT", "http://localhost:8080/finalproj_war_exploded/api/clubs", true);
            xhttp.setRequestHeader('Content-type', 'application/json');
            xhttp.send(JSON.stringify({
                id: id,
                name: name,
                description: description,
                image: image,
            }));
    });



    let clubs = [];
    jQuery.ajax({
        url: "http://localhost:8080/finalproj_war_exploded/api/clubs",
        type: "GET",
        contentType: 'application/json; charset=utf-8',
        success: function (resultData) {
            clubs = resultData;
            displayClubs(clubs)
        },
        error: function (jqXHR, textStatus, errorThrown) {alert("GG");
        },
        timeout: 120000,
    });

    const displayClubs = (characters) => {
        id = 0;
        const htmlString = characters
            .map((character) => {
                return `
                <tr>
                        <td>${character.name}
                        </td>
                        <td>${character.description}
                        </td>
                        <td>
                        <a href="../jsp/redactClubPage.jsp?id=${character.id}">
                            <button class="btn btn-info mt-2">Edit club</button>
                        </a>
                        </td>
                </tr>
        `;
            })
            .join('');
        tbody.innerHTML = htmlString;
    };

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



   // DATE FORMATING
    function formatDate(date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2)
            month = '0' + month;
        if (day.length < 2)
            day = '0' + day;

        return [year, month, day].join('-');
    }

});
