$(function(){


    var dataIndex = 0;
    const datas = [];



    $('#form').submit(function(){
        var inputSei = $('#name1').val();
        var inputMei = $('#name2').val();
        const inputSex = $('input:radio[name="formGender"]:checked').val();
        var inputMail = $('#email').val();
        var inputTel = $('#tel').val();

        var inputData = {
            dataindex:dataIndex,
            sei:inputSei,
            mei:inputMei,
            sex:inputSex,
            mail:inputMail,
            tel:inputTel
        };


        if(errorCheck(inputData)==true){
        
            datas.push(inputData);
            addDataView(inputData,false); //（inputData,false?)
            dataIndex = dataIndex + 1;
            console.log(datas);
            return false;
        }else{
            return false;
        };

    });

    function addDataView(inputData,isEdit){
        //↓if(isEdit == true)が省略された形。
        if(isEdit){
            $('tr[data-index="' + (inputData.dataindex) + '"]').html('<td>' + (inputData.sei) + '</td><td>' + (inputData.mei) + '</td><td>' + (inputData.sex) + '</td><td>' + (inputData.mail) + '</td><td>' + (inputData.tel) + '</td><td><button type=button id=delete>削除</button></td><td><button type=button id=edit>編集</button></td></tr>')
        }else{
            $('#tbl').append('<tr data-index =' + inputData.dataindex + '><td>' + inputData.sei + '</td><td>' + inputData.mei + '</td><td>' + inputData.sex + '</td><td>' + inputData.mail + '</td><td>' + inputData.tel + '</td><td><button type=button id=delete>削除</button></td><td><button type=button id=edit>編集</button></td></tr>')
        };

        $("#form")[0].reset();
        $("#radio1").attr('checked', false);
        $("#radio2").attr('checked', false);

    }

    function errorCheck(inputData){
        let checkErrors = 
        [!(inputData.sei).match(/^[ぁ-んァ-ヶ亜-熙纊-黑]*$/) || inputData.sei == "", 
        !(inputData.mei).match(/^[ぁ-んァ-ヶ亜-熙纊-黑]*$/) || inputData.mei == "",
        inputData.sex != "男性" && inputData.sex != "女性",
        !(inputData.mail).match(/^[a-zA-Z0-9]{1}[a-zA-Z0-9.-_]*@{1}[a-zA-Z0-9.-_]+\.[a-zA-Z0-9]+$/) || inputData.mail == "",
        !(inputData.tel).match(/^\d{2,3}-\d{3,4}-\d{3,4}$/) || inputData.tel == ""];

        checkErrors.forEach(function(element, index){
            if (element) {
                $('#matchChk' + (index + 1)).show();
            } else {
                $('#matchChk' + (index + 1)).hide();
            }
        });
        
        return !(checkErrors.indexOf(true) > -1)
    };

    //CHK
    $("#tbl").on('click','#delete',function(){
        var obj = $(this).parent().parent();
        var deleteIndex = obj.attr("data-index");
        $('tr[data-index =' + deleteIndex + ']').remove(); //"’の付け方は基本同じ。'a"aa"a'みたいに使うこともできる。
    });



    var editIndex;
    $("#tbl").on("click", "#edit",function(){
        var obj = $(this).parent().parent();
        editIndex = obj.attr("data-index");
        $("#name1").val(datas[editIndex].sei);
        $("#name2").val(datas[editIndex].mei);
        $("#email").val(datas[editIndex].mail);
        $("#tel").val(datas[editIndex].tel);

        if(datas[editIndex].sex=="女性"){
            $("#radio1").attr('checked',true);
        }else{
            $("#radio2").attr('checked',true);
        };
    });

 
    $(".btn-update").on('click',function(){
        var inputSei = $("#name1").val();
        var inputMei = $("#name2").val();
        const inputSex = $('input:radio[name="formGender"]:checked').val();
        var inputMail = $("#email").val();
        var inputTel = $("#tel").val();

        var inputData = {
            dataindex: parseInt(editIndex),
            sei:inputSei,
            mei:inputMei,
            sex:inputSex,
            mail:inputMail,
            tel:inputTel
        }


        if(errorCheck(inputData)==true){

            datas[editIndex] = inputData;
            addDataView(inputData,true); //（inputData,false?)
            return false;

         }else{
            return false;
        }

    });

    $(".btn-search").click('click', function(){
        var searchSei = $("#name1").val();
        var searchMei = $("#name2").val();
        const searchSex = $('input:radio[name="formGender"]:checked').val();
        var searchMail = $("#email").val();
        var searchTel = $("#tel").val();

        console.log(datas);

        const filteredData= datas.filter((data) =>{
            return data.sex == searchSex && (data.sei).includes(searchSei) && (data.mei).includes(searchMei) && (data.mail).includes(searchMail) && (data.tel).includes(searchTel);
        });

        var indexs = [];
        filteredData.forEach(function(element){
            indexs.push(element.dataindex)
        });

        datas.forEach(function(element){
            if (indexs.indexOf(element.dataindex) > -1) {
                $('tr[data-index = ' + element.dataindex + ']').show();
            } else {
                $('tr[data-index = ' + element.dataindex + ']').hide();
            }
        });
        
        $(".btn-back").show();

    })

    $(".btn-back").click('click', function(){
        $('tr').show();
        $("#form")[0].reset();
        $("#radio1").attr('checked', false);
        $("#radio2").attr('checked', false);
        $(".btn-back").hide();
    })
    

});



// $(function(){
//     $('#form').validate({
//         errorElement:'p',
//         rules:{
//             Name1: {
//                 required: true,
//                 pattern:/^[ぁ-んァ-ヶ亜-熙纊-黑]*$/i
//             },
//             Name2: {
//                 required: true,
//                 pattern:/^[ぁ-んァ-ヶ亜-熙纊-黑]*$/i
//             },
//             formGender: {
//                 required: true,
//             },
//             Mail: {
//                 required: true,
//                 pattern:/^[a-zA-Z0-9]{1}[a-zA-Z0-9.-_]*@{1}[a-zA-Z0-9.-_]+\.[a-zA-Z0-9]+$/i
//             },
//              Tel: {
//                 required: true,
//                 pattern:/^\d{2,3}-\d{3,4}-\d{3,4}$/i
//             },
//         },

//         messages:{
//             Name1:{
//                 required: "姓を入力してください",
//                 pattern:"全角で入力してください"
//             },
//             Name2:{
//                 required: "名を入力してください",
//                 pattern:"全角で入力してください"
//             },
//             formGender: {
//                 required: "性別にチェックを入れてください",
//             },
//             Mail: {
//                 required: "メールアドレスを入力してください",
//                 pattern:"メールアドレスの形式で入力してください"
//             },
//              Tel: {
//                 required: "電話番号を入力してください",
//                 pattern:"半角(ハイフン付き)で入力してください"
//             },
//         },

    

//         errorPlacement: function(error, element){
//            if(element.attr('name') == 'formGender'){
//                error.insertAfter('#chk3')
//            }else if(element.attr('name') =='Name1') {
//                error.insertAfter('#chk1')
//            }else if(element.attr('name') =='Name2') {
//                error.insertAfter('#chk2')   
//            }else if(element.attr('name') =='Mail'){
//                error.insertAfter('#chk4')
//            }else if(element.attr('name') =='Tel'){
//                error.insertAfter('#chk5')
//            }else{
//                return true;
//            }

//            },

        
//         // submitHandler:function(form)
//         //     {('#form').submit();}
//         // });
//     });