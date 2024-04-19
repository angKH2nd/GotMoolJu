//  디테일맵 이동

function openDetailView(value){

    var elements = document.getElementsByClassName("re");
    var div = document.getElementsByClassName("detailMap-outer");
    for (var i = 0; i < elements.length; i++) {
        
        var displayStyle = window.getComputedStyle(elements[i]).display;
        if (displayStyle === "none") {
            toggleDiv('re');
            detailAptList(value, aptLocation)
            div[i].scrollTop=0;
        } else if (displayStyle === "block") {
            
            detailAptList(value, aptLocation)
            div[i].scrollTop=0;
        }
    }

    

}

function detailAptList(value){

    $.ajax({
        url:"detailApt.ma",
        data:{
            aptName: value[0],
            aptLocation: value[1]
        },
        success:function(data){

            let aptData = "";

            for(let i=0; i<data.length; i++){

                aptData += "<div class='detailMap-apt'>"
                         + "<div class='detailMap-apt-img centerXY'>"
                         + "<img src='" + data[i].aptImgUrl + "'>"
                         + "</div>"
                         + "<div class='detailMap-apt-content'>"
                         + "<div>" + data[i].aptNo + "</div>"
                         + "<ul>"
                         + "<li style='font-size: 20px;'>" + data[i].aptSellingType + data[i].aptPrice + "</li>" + "<br>"
                         + "<li>" + data[i].aptName + "</li>" + "<br>"
                         + "<li>" + data[i].aptDesc + "</li>"
                         + "</ul>"
                         + "</div>"
                         + "</div>"

            }

                $(".detailMap-outer").html(aptData);


        },
        error:function(){
            console.log("실패");
        }



    })




}


