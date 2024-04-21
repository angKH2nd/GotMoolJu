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
			let aptListTitle = data[0].aptAddress;

            for(let i=0; i<data.length; i++){
                aptData += `
						    <div class='detailMap-apt' onclick="toggleAptDetailDiv('aptDetailForm', ${data[i].aptNo});">
						        <div class='detailMap-apt-img centerXY hoverZ'>
						            <img src='${data[i].aptImgUrl}'>
						        </div>
						        <div class='detailMap-apt-content'>
						            <div><i class="fa-brands fa-bandcamp"></i> 매물번호 <span style="color: blue;">${data[i].aptNo}</span></div>
						            <ul>
						                <li><i class="fa-solid fa-sack-dollar"></i> ${data[i].aptSellingType}${data[i].aptPrice}</li>
						                <li><i class="fa-solid fa-building"></i> &nbsp;${data[i].aptName}</li>
						                <li><i class="fa-solid fa-tag"></i> <span style="color: gray;">${data[i].aptDesc}</span></li>
						            </ul>
						        </div>
						    </div>
						   `;
            }
            $(".detailMap-outer").html(aptData);
            $(".detailMap-top-title").html(aptListTitle);
            cancelAptDetailDiv();
        },
        error:function(){
            console.log("실패");
        }
    })
}
