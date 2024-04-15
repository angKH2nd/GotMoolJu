function openDetailView(num1){
    console.log(num1[0],num1[1],num1[2]);
    toggleDiv('re');
    $("#test1").val(num1);
    $("#test2").val(num2);
    $("#test3").val(num3);

    console.log("디테일에서 실험 중" + $("#test1").val() + "되냐?");
        console.log("디테일에서 실험 중" + $("#test2").val() + "되냐?");
        console.log("디테일에서 실험 중" + $("#test3").val() + "되냐?");
}