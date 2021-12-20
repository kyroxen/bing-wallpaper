# bing-wallpaper
Bing Wallpaper fetch.
The API curl:
```
curl --location --request GET 'https://cn.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=en-US' \
--header 'Referer: https://cn.bing.com' \
--header 'User-Agent: Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 10.0; WOW64; Trident/8.0; .NET4.0C; .NET4.0E)'
```

The API's sample response:
```
<?xml version="1.0" encoding="utf-8" ?>
<images>
    <image>
        <startdate>20211205</startdate>
        <fullstartdate>202112050000</fullstartdate>
        <enddate>20211206</enddate>
        <url>/th?id=OHR.SalzburgKrampus_EN-US9186815435_1920x1080.jpg&amp;rf=LaDigue_1920x1080.jpg&amp;pid=hp</url>
        <urlBase>/th?id=OHR.SalzburgKrampus_EN-US9186815435</urlBase>
        <copyright>Salzburg with Salzach river, Austria (© MacEaton/Alamy)</copyright>
        <copyrightlink>https://www.bing.com/search?q=salzburg+austria&amp;form=hpcapt&amp;filters=HpDate%3a%2220211205_0800%22</copyrightlink>
        <headline>Cheers and fears in Salzburg</headline>
        <drk>1</drk>
        <top>1</top>
        <bot>1</bot>
        <hotspots></hotspots>
    </image>
    <tooltips>
        <loadMessage>
            <message>Loading...</message>
        </loadMessage>
        <previousImage>
            <text>Previous image</text>
        </previousImage>
        <nextImage>
            <text>Next image</text>
        </nextImage>
        <play>
            <text>Play video</text>
        </play>
        <pause>
            <text>Pause video</text>
        </pause>
    </tooltips>
</images>
```

We need to extract the url base out of the response and make a request to fetch the image from their servers like so:
```
curl --location --request GET 'https://cn.bing.com/th?id=OHR.SalzburgKrampus_EN-US9186815435_UHD.jpg'
```

# Script to set env vars in postman
```
const responseJson = xml2Json(pm.response.text());
const baseUrl = responseJson.images.image.urlBase;
console.log(baseUrl);
pm.environment.set("base-url", baseUrl+"_UHD.jpg");
```
