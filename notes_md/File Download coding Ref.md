# Java Code Ref


 To download a file using Java 8 programming, you can use the Java IO package. 
 Here is a code snippet that demonstrates how to download a file from a URL:

 import java.io.BufferedInputStream;
 import java.io.FileOutputStream;
 import java.io.IOException;
 import java.net.URL;

 public class DownloadFile {
    public static void main(String[] args) throws IOException {
        URL url = new URL("https://example.com/file.pdf");
        BufferedInputStream in = new BufferedInputStream(url.openStream());
        FileOutputStream fileOutputStream = new FileOutputStream("file.pdf");
        byte[] dataBuffer = new byte[1024];
        int bytesRead;
        while ((bytesRead = in.read(dataBuffer, 0, 1024)) != -1) {
            fileOutputStream.write(dataBuffer, 0, bytesRead);
        }
        in.close();
        fileOutputStream.close();
    }
 }

# JavaScript Ref
 
 To download a file using JavaScript, you can use an invisible anchor with a download attribute. 
 When the download attribute is set on an anchor, it will try to download the resource at the href attribute 
 [1. Here is an example code snippet that demonstrates how to download a file in JavaScript:](https://webtips.dev/download-any-file-with-javascript)
 
 function downloadFile(url, filename) {
    var element = document.createElement('a');
    element.setAttribute('href', url);
    element.setAttribute('download', filename);
    element.style.display = 'none';
    document.body.appendChild(element);
    element.click();
    document.body.removeChild(element);
 }

 This function takes two parameters: url and filename. 
 The url parameter specifies the URL of the file to be downloaded, and the filename parameter specifies the name of the file to be saved on the user’s computer. 
 When this function is called, it creates an invisible anchor with the specified URL and filename, appends it to the document body, triggers a click event on it, and then removes it from the document body 1.
 
# AJAX

 To download a file using AJAX, you can use the XMLHttpRequest object to send an HTTP GET request to the server. 
 When the server responds with the file data, you can create a new Blob object with the data and then create a URL for the blob using URL.createObjectURL(). 
 [Finally, you can create a new anchor element with the URL and click it to initiate the download.](https://stackoverflow.com/questions/20830309/download-file-using-an-ajax-request)

 Here is an example code snippet that demonstrates how to download a file using AJAX:
 
 function downloadFile(url, filename) {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', url, true);
    xhr.responseType = 'blob';
    xhr.onload = function() {
        if (xhr.status === 200) {
            var blob = new Blob([xhr.response], {type: 'application/octet-stream'});
            var link = document.createElement('a');
            link.href = URL.createObjectURL(blob);
            link.download = filename;
            link.click();
        }
    };
    xhr.send();
 }

 This function takes two parameters: url and filename. 
 The url parameter specifies the URL of the file to be downloaded, and the filename parameter specifies the name of the file to be saved on the user’s computer. 
  When this function is called, it sends an HTTP GET request to the specified URL, creates a new Blob object with the response data, 
 creates a new anchor element with the URL of the blob and filename, 
 [clicks it to initiate the download, and then releases the URL object.](https://stackoverflow.com/questions/1999607/download-and-open-pdf-file-using-ajax)
 
 # How do I download multiple pdf files using JavaScript?
 
 To download multiple PDF files using JavaScript, you can use the JSZip library to create a zip file containing the PDF files and then prompt the user to download the zip file.
 Here is an example code snippet that demonstrates how to download multiple PDF files using JavaScript:
 
 function downloadPDFs(urls) {
    var zip = new JSZip();
    var count = 0;
    urls.forEach(function(url) {
        JSZipUtils.getBinaryContent(url, function(err, data) {
            if (err) {
                throw err;
            }
            zip.file(url.split('/').pop(), data, {binary:true});
            count++;
            if (count == urls.length) {
                zip.generateAsync({type:'blob'}).then(function(content) {
                    saveAs(content, 'pdfs.zip');
                });
            }
        });
    });
 }
 
 This function takes an array of PDF URLs as a parameter and downloads them as a zip file. When this function is called, it creates a new JSZip object and then iterates over the URLs in the array.
 For each URL, it uses JSZipUtils.getBinaryContent() to download the PDF file as binary data and then adds it to the zip file with a filename based on the last part of the [URL.](https://medium.com/twodigits/ multi-file-download-using-javascript-9b0b8a14639b) 
 [When all of the PDF files have been added to the zip file, it generates a blob of the zip file and prompts the user to download it with a filename of pdfs.zip.](https://stackoverflow.com/questions/17274655/how-to-download-zip-and-save-multiple-files-with-javascript-and-get-progress)
 
 # JavaScript For loop
 
 If you're looking for an alternative to the `for each` loop in JavaScript, there are several options available. One option is to use the `Array.forEach()` method,
 which allows you to iterate over an array and execute a function for each element. 
 Here's an example:

 const array = [1, 2, 3];
  array.forEach(element => {
   console.log(element);
 });


 Another option is to use the `for...of` loop, which allows you to iterate over any iterable object (such as an array or a string) and execute a block of code for each element.
 Here's an example:

 const array = [1, 2, 3];
  for (const element of array) {
   console.log(element);
 }

 If you're looking for a way to iterate over the properties of an object, you can use the `Object.keys()` method to get an array of the object's keys and then use the `Array.forEach()`
 method to iterate over the keys and execute a function for each key-value pair:

 const object = {a: 1, b: 2, c: 3};
  Object.keys(object).forEach(key => {
   console.log(key + ': ' + object[key]);
 });


 Source:
 
  [JavaScript forEach | Looping Through an Array in JS.](https://khalilstemmler.com/blogs/javascript/for-each/.)
  [JavaScript alternative to "for each" loop - Stack Overflow.]( https://stackoverflow.com/questions/12637289/javascript-alternative-to-for-each-loop.)
  [Javascript - alternative to for loop - Stack Overflow.](https://stackoverflow.com/questions/34832435/alternative-to-for-loop.)
  [Don't use Array.forEach, use for() instead Example - Coderwall.](https://coderwall.com/p/kvzbpa/don-t-use-array-foreach-use-for-instead.)


