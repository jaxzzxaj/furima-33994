document.addEventListener('DOMContentLoaded', function(){
  if (document.getElementById('product_image')){
  const ImageList = document.getElementById('image-list');

      // 選択した画像を表示する関数
      const createImageHTML = (blob) => {
       // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div')
      imageElement.setAttribute('class', "image-element")
      let imageElementNum = document.querySelectorAll('.image-element').length


      // 表示する画像を生成
      const blobImage = document.createElement('img')
      blobImage.setAttribute('src', blob)

      // ファイル選択ボタンを生成
      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('name', 'product[images][]')
      inputHTML.setAttribute('id', `product_image_${imageElementNum}`)
      inputHTML.setAttribute('type', 'file')
      inputHTML.setAttribute('class','file_btn')

      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage)
      imageElement.appendChild(inputHTML)
      ImageList.appendChild(imageElement)

      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      })
    };

      document.getElementById('product_image').addEventListener('change',(e) => {
      let file = e.target.files[0];
      let blob = window.URL.createObjectURL(file);

      createImageHTML(blob)
    });
  }
});