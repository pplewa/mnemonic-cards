mnemonic-cards is a simple cards guessing mobile web app
---

    
While learning [Dominic System](http://en.wikipedia.org/wiki/Mnemonic_dominic_system "Dominic System") come into the situation that although game cards are great for remembering journeys, they only cover 52 out of 100 possible numbers/actors/actions. This app intention is to ease learning of the remaining 48.

![Screen 1](/screens/screen-1.jpg "Screen 1")
![Screen 2](/screens/screen-2.jpg "Screen 2")

To start up, clone the repository and run in the terminal:

    > npm install
    > lineman run
    
and point the browser to `http://localhost:8000`

If required the app can be build and deployed to any web server.

    > lineman build

The app assumes card mappings listed below, but can be easily changed or extended. To do so, simply edit `app/js/cards.coffee`

    app.cards = [
        {
            "label": "OO",
            "value": "00"
        },
        {
            "label": "OA",
            "value": "01"
        },
        {
            "label": "OB",
            "value": "02"
        },
        {
            "label": "OC",
            "value": "03"
        },
        {
            "label": "OD",
            "value": "04"
        },
        {
            "label": "OE",
            "value": "05"
        },
        {
            "label": "OS",
            "value": "06"
        },
        {
            "label": "OG",
            "value": "07"
        },
        {
            "label": "OH",
            "value": "08"
        },
        {
            "label": "ON",
            "value": "09"
        },
        {
            "label": "AO",
            "value": "10"
        },
        {
            "label": "AA",
            "value": "11"
        },
        {
            "label": "AB",
            "value": "12"
        },
        {
            "label": "AE",
            "value": "15"
        },
        {
            "label": "AG",
            "value": "17"
        },
        {
            "label": "AN",
            "value": "19"
        },
        {
            "label": "BO",
            "value": "20"
        },
        {
            "label": "BA",
            "value": "21"
        },
        {
            "label": "BB",
            "value": "22"
        },
        {
            "label": "BC",
            "value": "23"
        },
        {
            "label": "BD",
            "value": "24"
        },
        {
            "label": "BE",
            "value": "25"
        },
        {
            "label": "BS",
            "value": "26"
        },
        {
            "label": "BG",
            "value": "27"
        },
        {
            "label": "BH",
            "value": "28"
        },
        {
            "label": "BN",
            "value": "29"
        },
        {
            "label": "CO",
            "value": "30"
        },
        {
            "label": "DO",
            "value": "40"
        },
        {
            "label": "EO",
            "value": "50"
        },
        {
            "label": "EA",
            "value": "51"
        },
        {
            "label": "EB",
            "value": "52"
        },
        {
            "label": "EE",
            "value": "55"
        },
        {
            "label": "EG",
            "value": "57"
        },
        {
            "label": "EN",
            "value": "59"
        },
        {
            "label": "SO",
            "value": "60"
        },
        {
            "label": "GO",
            "value": "70"
        },
        {
            "label": "GA",
            "value": "71"
        },
        {
            "label": "GB",
            "value": "72"
        },
        {
            "label": "GE",
            "value": "75"
        },
        {
            "label": "GG",
            "value": "77"
        },
        {
            "label": "GN",
            "value": "79"
        },
        {
            "label": "HO",
            "value": "80"
        },
        {
            "label": "NO",
            "value": "90"
        },
        {
            "label": "NA",
            "value": "91"
        },
        {
            "label": "NB",
            "value": "92"
        },
        {
            "label": "NE",
            "value": "95"
        },
        {
            "label": "NG",
            "value": "97"
        },
        {
            "label": "NN",
            "value": "99"
        }
    ]

Uses:

* Lineman
* Backbone + localstorage
* Swipe.js
* Zepto