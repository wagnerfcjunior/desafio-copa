<template>
    <div>
        <h2>Times</h2>
        <div class="row">
            <div class="col-md-6">
                <div class="row">
                </div>
            </div>
            <div class="col-md-6">
                <div class="row">
                    <div class="col-6">
                        <label class="label">Nome da equipe</label>
                        <input type="text"
                            v-model="nome"
                            placeholder=""
                            class="form-control"
                            required />
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <label class="label">Número de jogadores</label>
                        <input type="text"
                            v-model="total_jogadores"
                            placeholder=""
                            class="form-control"
                            required />
                    </div>
                    <div class="col-6">
                        <label class="label">Número jogadores na defesa</label>
                        <input type="text"
                            v-model="total_defesa"
                            placeholder=""
                            class="form-control"
                            required />
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <label class="label">Número jogadores no ataque</label>
                        <input type="text"
                            v-model="total_ataque"
                            placeholder=""
                            class="form-control"
                            required />
                    </div>
                    <div class="col-6">
                        <label class="label">Número jogadores no meio</label>
                        <input type="text"
                            v-model="total_meio"
                            placeholder=""
                            class="form-control"
                            required />
                    </div>
                </div>
            </div>
        </div>

        <!-- renderizar somente na edição  -->
        <button v-if="isEditing" @click="updateEquipe">Atualizar</button>
        <button v-if="isEditing" @click="cancelEdit">Cancelar</button>
        
        <!-- renderizar quando não for edição  -->
        <button v-else @click="createEquipe">Criar</button>

        <!-- lista de equipes -->
        <div v-for="equipe in listaEquipes" :key="equipe.id">
            <p>
                [{{ equipe.id }}] {{ equipe.nome }} / {{ equipe.total_jogadores }} / partidas / vitórias / derrotas / ações
                <button @click="editEquipe(equipe.id)">Editar</button>
                <button @click="deleteEquipe(equipe.id)">Excluir</button>
            </p>
        </div>

    </div>
</template>

<script setup>

    import { ref , onMounted } from 'vue';

    const listaEquipes = ref([])
    const nome = ref('')
    const total_jogadores = ref('')
    const total_defesa = ref('')
    const total_ataque = ref('')
    const total_meio = ref('')
    const equipe_id = ref(0)
    const isEditing = ref(false)
    const API_URL = "http://localhost:3000/equipes"

    onMounted( async () =>{
        const response = await fetch(API_URL)
        listaEquipes.value = await response.json()
    })

    const createEquipe = async() => {
        const res = await fetch(API_URL, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                nome: nome.value,
                total_jogadores: total_jogadores.value,
                total_defesa: total_defesa.value,
                total_ataque: total_ataque.value,
                total_meio: total_meio.value
            })
        })

        const data = await res.json()

        listaEquipes.value.push(data)
        nome.value = ''
        total_jogadores.value = ''
        total_defesa.value = ''
        total_ataque.value = ''
        total_meio.value = ''
        isEditing.value = false;
    }

    const editEquipe = async(id) => {
        const equipe = listaEquipes.value.find(equipe =>equipe.id == id)

        nome.value = equipe.nome
        total_jogadores.value = equipe.total_jogadores
        total_defesa.value = equipe.total_defesa
        total_ataque.value = equipe.total_ataque
        total_meio.value = equipe.total_meio
        equipe_id.value = equipe.id
        isEditing.value = true;
    }

    const updateEquipe = async() => {
        const res = await fetch(`${API_URL}/${equipe_id.value}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                nome: nome.value,
                total_jogadores: total_jogadores.value,
                total_defesa: total_defesa.value,
                total_ataque: total_ataque.value,
                total_meio: total_meio.value,
                id: equipe_id.value
            })
        })

        const data = await res.json()

        const index = listaEquipes.value.findIndex(equipe => equipe.id === data.id)

        listaEquipes.value[index] = data
        nome.value = ''
        total_jogadores.value = ''
        total_defesa.value = ''
        total_ataque.value = ''
        total_meio.value = ''
        isEditing.value = false
        equipe_id.value = 0
    }

    const deleteEquipe = async(id) => {
        const res = await fetch(`${API_URL}/${id}`, {
            method: 'DELETE'
        })

        listaEquipes.value = listaEquipes.value.filter(equipe => equipe.id!== id)
    }

    const cancelEdit = () => {
        nome.value = ''
        total_jogadores.value = ''
        total_defesa.value = ''
        total_ataque.value = ''
        total_meio.value = ''
        equipe_id.value = 0
        isEditing.value = false;
    }



</script>

<style scoped>
  .form-control {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    border: 2px solid #ccc;
    background-color: #f8f8f8;
    color: #111;
    border-radius: 4px;
    resize: vertical;
  }

   .label {
    text-align: left;
    float: left;
   }


</style>