/* global locatStorage */

function shoppingCart(){
	document.getElementById('cartPanel').classList.toggle('active');
}

//Get Longitude and Latitude of place
 function getLocation(){
                const showDetails=document.querySelector('.details');
                
                    if(navigator.geolocation){
                        navigator.geolocation.getCurrentPosition(
                            async(position) => {
                                const{latitude,longitude}=position.coords;

                                let response=await fetch(`https://nominatim.openstreetmap.org/reverse?lat=${position.coords.latitude}&lon=${position.coords.longitude}&format=json`);

                                let data =await response.json();
                                console.log(data);
                                 showDetails.textContent = `${data.address.suburb} ${data.address.city},${data.address.state}`;
                        },(error)=>{
                            console.log(error.message);
                        });
                    }
             

            }

    