$(document).ready(function() {
    $('#news').click(function(){
            $('#newsInfo').css('display','flex');
            $('#clubsInfo').css('display','none');
            $('#eventsInfo').css('display','none');
        }
    );
    $('#clubs').click(function(){
            $('#clubsInfo').css('display','flex');
            $('#newsInfo').css('display','none');
            $('#eventsInfo').css('display','none');
        }
    );
    $('#events').click(function(){
            $('#eventsInfo').css('display','flex');
            $('#newsInfo').css('display','none');
            $('#clubsInfo').css('display','none');
        }
    );
});
