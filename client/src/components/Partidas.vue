<template>
    <div>
        <button @click="createPartida">Sortear partida</button>

        <!-- lista de partidas -->
        <div v-for="partida in listaPartidas" :key="partida.id">
            <p>
                [{{ partida.id }}] - {{ partida.data_partida }}
            </p>
            <p>
                {{ partida.time1_id[0].nome }} X {{ partida.time2_id[0].nome }}                                 
            </p>
        </div>

        <!-- criando partida --> 




    </div>
</template>

<script setup>
    import { ref , onMounted } from 'vue';

    const listaPartidas = ref([])
    const time1 = []
    const time2 = []
    const data_partida = []
    const partida_id = ref(0)
    const API_URL = "http://localhost:3000/partidas"
    const API_URL_EQUIPES = "http://localhost:3000/equipes/random"
    const start = new Date(2001, 0, 1)
    const end = new Date()

    onMounted( async () =>{
        const response = await fetch(API_URL)
        listaPartidas.value = await response.json()
    })

    const createPartida = async () => {
        
        let data_sorteada = randomDate(start,end)
        let num = 0
        const response_equipes = await fetch(API_URL_EQUIPES)
        const listaEquipes = await response_equipes.json()

        listaEquipes.forEach((item) => {

            Object.entries(item).forEach(([key, value]) => {
                if((key == "id" || key == "nome") && (num == 0)){
                   // console.log(`${key}: ${value}`)
                    time1[key] = value
                }else if((key == "id" || key == "nome") && (num == 1)){
                 //   console.log(`${key}: ${value}`)
                    time2[key] = value
                }
            })
            num++
        })
        
console.log(time1['id'],time2['id'])

        const res = await fetch(API_URL, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                time1_id: time1['id'],
                time2_id: time2['id'],
                data_partida: data_sorteada,
                vencedor_id: time1['id']
            })
        })

        const data = await res.json()

        

    }
    
    function randomDate(start, end) {
        const data_ = new Date(start.getTime() + Math.random() * (end.getTime() - start.getTime()))
        let dia = data_.getDate();
        let mes = data_.getMonth();
        let ano = data_.getFullYear();
        if (dia < 10) {
            dia = `0${dia}`;
        }else if(dia == 0){
            dia = "01";
        }

        if (mes < 10) {
            mes = `0${mes}`;
        }

        return `${dia}/${mes}/${ano}`;
    }


</script>

<style scoped>

</style>