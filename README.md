# <img align="center" width=70px height=70px src="https://media3.giphy.com/media/gaozKmGlTJbBnwT5av/200w.webp?cid=ecf05e477dfxjo8wdjl2xcyi6hjhfbtkemj784yotetprezi&rid=200w.webp&ct=s">Serial Peripheral Interface

<p align="center">
   <img width=100%  src="https://rapidapi.com/blog/wp-content/uploads/2018/06/web-animation-gif.gif" alt="logo">
</p>

<p align="center"> 
    <br> 
</p>

## <img align= center width=50px height=50px src="https://thumbs.gfycat.com/HeftyDescriptiveChimneyswift-size_restricted.gif"> Table of Contents

- <a href ="#about"> 📙 overview</a>
- <a href ="#Started"> 💻 Get Started</a>
- <a href ="#Work"> ⚙️   How project Work</a>
- <a href ="#Screenshots"> 📷 Demo Screenshots</a>
  - <a href="#sd"> 📄 Simulation Results of Development testbench</a>
  - <a href="#wd"> 〽️ Waveform of Development testbench</a>
  - <a href="#sm">📄 Simulation Results of Master testbench</a>
  - <a href="#wm">〽️ Waveform of Master testbench</a>
  - <a href="#ss">📄 Simulation Results of Slave testbench</a>
  - <a href="#ws">〽️ Waveform of Slave testbench</a>
- <a href ="#Structure"> 📁  File Structure</a>
- <a href ="#Contributors"> ✨ Contributors</a>
<hr style="background-color: #4b4c60"></hr>

## <img align="center"  width =60px  height =70px src="https://media2.giphy.com/media/Yn4nioYWSZMqiPNVuD/giphy.gif?cid=ecf05e47m5h78yoqhdkg8pq54o5qsxhdoltjxyfe08d4vxvg&rid=giphy.gif&ct=s"> overview <a id = "about"></a>

Design and implementation the following components of the SPI modules using verilog such that they match the requirements of the development testbench and match the SPI specifications:
<ul> 
<li >Master </li>
<li>
Slave
</li>
<li>
 Self-Checking Testbenches for the Master and Slave.
 </li>
</ul> 
<img src="https://user-images.githubusercontent.com/71986226/154839234-d42ca7ce-f947-4208-801e-d5ce07bca857.png">
<hr style="background-color: #4b4c60">

## <img align= center width=50px height=50px src="https://media0.giphy.com/media/QvpqIQAAl66EfoTJj8/200w.webp?cid=ecf05e47kn4j0qln8fk4xybgqwle0nju8stj9hjw4z6fk8c2&rid=200w.webp&ct=s"> Get Started <a id = "Started"></a>

<ol>
<li>Clone the repository

```
git clone https://github.com/EslamAsHhrafSerial-Peripheral-Interface
```
</li>
<li>
Main File is

```
Serial-Peripheral-Interface/DevelopmentTB.v
```
</li>
<li>
Read <a href="https://github.com/EslamAsHhraf/Serial-Peripheral-Interface/blob/master/CMP1030%20Project%20Description.pdf">Project Description</a> to undertand project vey well
</li>
</ol>
<hr style="background-color: #4b4c60">

## <img align= center width=50px height=50px src="https://media3.giphy.com/media/ViCO3ua8uHhhA2ZQ4J/giphy.gif?cid=ecf05e47yeo8vftfrfkkie7ewyvfwkwon92tsapvyhevi9iv&rid=giphy.gif&ct=s"> How project Work <a id ="Work"></a>
<ul>
<li>After each CLK the Master chose The Slave Again with CS with Enable One Slave and Disable the Other.</li>
<li>At Test Bench of the Master is to Send and Receive data from many Slaves at Same Time This Is Mainly Testing the ability Of the Exchange Between the Master and Many Slaves.</li>
<li>At Test Bench of The Slave Is to Receive Data from Master and makes shift Operation and Resend Shifted Data.</li>
<li>
It wait the signal of start to begin the transmission (also the master will read "masterDataToSend" in order to send it to the slave).</li>
<li>
And it takes 8 periods to send all data from the master to slave and slave to master.</li>
<li>
We make it with 2 test cases different.
</li>
</ul>

#### At Posedge
Both the Master and the slave take shifting operation which the Master writes data to the MOSI and the Slave Writes data to the MISO.
<hr>

#### At Negedge
Both the Master and the Slave make sampling operation which the Master reads data From the MISO and The Slave reads data from the MOSI
<hr>

#### How Data transfered between Master and Slave
the data is shown on the MOSI and MISO line.
The start and end of transmission is indicated by the dotted green line, the
sampling edge is indicated in orange, and the shifting edge is indicated
in blue. Please note these figures are for illustration purpose only. For
successful SPI communications, users must refer to the product data
sheet and ensure that the timing specifications for the part are met

<img src="https://user-images.githubusercontent.com/71986226/154839368-be3931a5-815d-4c30-8aac-a465262620bd.png">
<hr>

#### Multislave SPI configuration
<img src="https://user-images.githubusercontent.com/71986226/154839419-0b63b22b-f31b-40de-ac87-19974e17b9fb.png">

<hr style="background-color: #4b4c60"></hr>

## <img align= center width=50px height=50px src="https://media0.giphy.com/media/gp1fRRB4AcbS0DbhZc/giphy.gif?cid=ecf05e474k7ih4mxqxl87j893egl3sdfcp2ygrvp95nrzc5j&rid=giphy.gif&ct=s"> Demo Screenshots <a id ="Screenshots"></a>

### Simulation Results of Development testbench <a id="sd"></a>
<img align= center src="https://user-images.githubusercontent.com/71986226/154839792-7427bde2-fa88-4fdf-a2f7-4c7339fad3d0.png">
<hr>

### Waveform of Development testbench <a id="wd"></a>
<img align= center src="https://user-images.githubusercontent.com/71986226/154840159-1bc382d8-a8e9-4335-bc9e-b8c5f2438d7c.JPG">
<hr>

### Simulation Results of Master testbench <a id="sm"></a>
<img align= center src="https://user-images.githubusercontent.com/71986226/154839974-30f1b256-c6e8-4305-9a9b-b84e32162cff.png">
<hr>

### Waveform of Master testbench <a id="wm"></a>
<img align= center src="https://user-images.githubusercontent.com/71986226/154839991-799a8295-8a4e-4e5e-85b1-56a730642d0c.png">
<hr>

### Simulation Results of Slave testbench <a id="ss"></a>
<img align= center src="https://user-images.githubusercontent.com/71986226/154840021-b5fe6bb7-46c9-42db-a759-36f1e84d8e83.png">
<hr>

### Waveform of Slave testbench <a id="ws"></a>
<img align= center src="https://user-images.githubusercontent.com/71986226/154840042-5571e770-576b-47e7-b4f8-b6926422da41.png">

<hr style="background-color: #4b4c60"></hr>

## <img align= center width=60px height=60px src="https://media1.giphy.com/media/igsIZv3VwIIlRIpq5G/giphy.gif?cid=ecf05e47faatmwdhcst7c2d4eontr459hjd35zf3an324elo&rid=giphy.gif&ct=s"> File Structure <a id="Structure"> </a>

```
Serial-Peripheral-Interface
├── Code
│   ├── Master.v
│   ├── Master.v.bak
│   ├── Master_tb.v
│   └── Master_tb.v.bak
├── CMP1030 Project Description.pdf
├── DevelopmentTB.v
├── DevelopmentTB.v.bak
├── Introduction-to-SPI-Interface.pdf
├── Lincense
├── README.md
└── Report .pdf
```


<hr style="background-color: #4b4c60"></hr>

## <img  align="center" width= 70px height =55px src="https://media0.giphy.com/media/Xy702eMOiGGPzk4Zkd/giphy.gif?cid=ecf05e475vmf48k83bvzye3w2m2xl03iyem3tkuw2krpkb7k&rid=giphy.gif&ct=s"> Contributors <a id ="Contributors"></a>

<table align="center" >
  <tr>
    <td align="center"><a href="https://github.com/AdhamAliAbdelAal" ><img src="https://avatars.githubusercontent.com/u/83884426?v=4" width="150px;" alt=""/><br /><sub><b>Adham Ali</b></sub></a><br />
    </td>
    <td align="center"><a href="https://github.com/Fathi79"><img src="https://avatars.githubusercontent.com/u/96377553?v=4" width="150px;" alt=""/><br /><sub><b>Abd Elrhman Fathi</b></sub></a><br /></td>
     <td align="center"><img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" width="150px;" alt=""/><br /><sub><b>Yousef Wear</b></sub></a><br /></td>
     <td align="center"><a href="https://github.com/EslamAsHhraf"><img src="https://avatars.githubusercontent.com/u/71986226?v=4" width="150px;" alt=""/><br /><sub><b>Eslam Ashraf</b></sub></a><br /></td>
  </tr>
</table>
