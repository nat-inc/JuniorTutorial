

$(function(){

    const characters = [
        {id: 1, name:"にんじゃわんこ", age: 14},
        {id: 2, name:"ベイビーわんこ", age: 5},
        {id: 3, name:"ひつじ仙人", age: 100},
        {id: 4, name:"仙人", age: 100},
        {id: 5, name:"ひつじ", age: 100},
        {id: 6, name:"にんじゃ仙人", age: 100}
      ];
      //追加
      characters.push({id:7, name:"わんこ", age: 20});

      var index2 = [];
      characters.forEach(function(element, index, array){
        if (element.age==5){
          index2.unshift(index)
          console.log(index2);
        }
      });
      
      
      //削除
      //①indexの指定で削除
      //delete characters[3];
      console.log(index2);
      index2.forEach(function(element, index, array){
        characters.splice(element, 1);
      });
      console.log(characters);

    var dataIndex = 0;
    const datas = [];

    $('#form').submit(function(){
        var textName1 = $('#name1').val();
        var textName2 = $('#name2').val();
        const str1 = $('input:radio[name="formGender"]:checked').val();
        var textEmail = $('#email').val();
        var textTel = $('#tel').val();
                
        var data = {
            dataindex: dataIndex, 
            sei: textName1,
            mei: textName2,
            mail: textEmail,
            tel: textTel,
            sex: str1
        };
        
            if(errorCheck(data)==true){
             
                datas.push(data);
                addDataView(data, false);
                dataIndex = dataIndex + 1;
                console.log(datas);
                return false;

            }else{
                return false;
            }           
        });

        function addDataView(data, isEdit) {
            if (isEdit) {
                $('tr[data-index="' + data.dataindex + '"]').html('<td>' + (data.sei) + '</td> <td>' + (data.mei) + '</td> <td>' + (data.sex) + '</td> <td>' + (data.mail) + '</td> <td>' + (data.tel) + '</td> <td><button type="button" class="btn">削除</button></td> <td><button type="button" class="btn2">編集</button></td>')
            } else {
                $('#tbl').append('<tr data-index=' + (data.dataindex) + '><td>' + (data.sei) + '</td> <td>' + (data.mei) + '</td> <td>' + (data.sex) + '</td> <td>' + (data.mail) + '</td> <td>' + (data.tel) + '</td> <td><button type="button" class="btn">削除</button></td> <td><button type="button" class="btn2">編集</button></td></tr>')
            }
           
            $('#form')[0].reset();
            $('#radio1').attr("checked",false);
            $('#radio2').attr("checked",false);
        }


        console.log(datas);

        function errorCheck(data){
            if (data.sei=="" || !(data.sei).match(/^[ぁ-んァ-ヶ亜-熙纊-黑]*$/)){
                alert("姓を入力してください");
                return false;
            
            }else if (data.mei=="" || !(data.mei).match(/^[ぁ-んァ-ヶ亜-熙纊-黑]*$/)){
                alert("名を入力してください");
                return false;

            }else if(data.sex!='男性' && data.sex!='女性'){
                alert("性別にチェックを入れてください");
                return false;

            }else if(data.mail=="" || !(data.mail).match(/^[a-zA-Z0-9]{1}[a-zA-Z0-9.-_]*@{1}[a-zA-Z0-9.-_]+\.[a-zA-Z0-9]+$/)){
                alert("メールアドレスを入力してください");
                return false;
            }else if(data.tel=="" || !(data.tel).match(/^\d{2,3}-\d{3,4}-\d{3,4}$/)){
                alert("電話番号を入力してください");
                return false;
            }else{
                return true;
            }

        
        }        

    $("#tbl").on('click', '.btn', function(){
        //ここ復習する//
        var obj = $(this).parent().parent();
        var index = obj.attr("data-index");
        $('tr[data-index="' + index + '"]').remove();
        
        });

    var edit_index;
    $("#tbl").on('click', '.btn2',function(){
        var obj = $(this).parent().parent();
        edit_index = obj.attr("data-index");
        $("#name1").val(datas[edit_index].sei);
        $("#name2").val(datas[edit_index].mei);
        $("#email").val(datas[edit_index].mail);
        $("#tel").val(datas[edit_index].tel);

        if (datas[edit_index].sex=="女性"){
            $("#radio1").attr("checked",true);

        }else{
            $("#radio2").attr("checked",true);
        }
    });

    $(".btn-update").on('click', function(){
        // edit_index //
        //$('tr[data-index="' + edit_index + '"]').remove();
       
        var textName1 = $('#name1').val();
        var textName2 = $('#name2').val();
        const str1 = $('input:radio[name="formGender"]:checked').val();
        var textEmail = $('#email').val();
        var textTel = $('#tel').val();


        var data = {
            dataindex: parseInt(edit_index), 
            sei: textName1,
            mei: textName2,
            mail: textEmail,
            tel: textTel,
            sex: str1
        }
        
            if(errorCheck(data)==true){

           
                datas[edit_index] = data;
                addDataView(data, true);
                return false;

            }else{
            return false;
            }        
    });


   console.log(datas);
   console.log(datas[1].sei);


//    datas.forEach((filtereddata)=>{
//        console.log(filtereddata);
//    });]

    // datas.forEach(function(value){
    //     console.log(value.name);
    // });
   
});

    






