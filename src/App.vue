<template>
  <v-app>
    <v-app-bar app color="primary" dark>
      <div class="d-flex align-center">
        <v-img
          alt="Vuetify Logo"
          class="shrink mr-2"
          contain
          src="https://cdn.vuetifyjs.com/images/logos/vuetify-logo-dark.png"
          transition="scale-transition"
          width="40"
        />

        <v-img
          alt="Vuetify Name"
          class="shrink mt-1 hidden-sm-and-down"
          contain
          min-width="100"
          src="https://cdn.vuetifyjs.com/images/logos/vuetify-name-dark.png"
          width="100"
        />
      </div>

      <v-spacer></v-spacer>

      <v-btn
        href="https://github.com/vuetifyjs/vuetify/releases/latest"
        target="_blank"
        text
      >
        <span class="mr-2">Latest Release</span>
        <v-icon>mdi-open-in-new</v-icon>
      </v-btn>
    </v-app-bar>

    <v-main>
      <v-data-table
        :items-per-page="5"
        class="elevation-1"
        :headers="[
          { value: 'id', text: 'ID' },
          { value: 'name', text: 'Name' },
          { value: 'email', text: 'Email' },
          { value: 'gender', text: 'Gender' },
          { value: 'status', text: 'Status' },
          { value: 'created_at', text: 'Created' },
          { value: 'updated_at', text: 'Updated' },
          { text: 'Actions', value: 'actions', sortable: false },
        ]"
        :items="datos"
      >
        <template v-slot:top>
          <v-toolbar flat>
            <v-toolbar-title>My CRUD</v-toolbar-title>
            <v-divider class="mx-4" inset vertical></v-divider>
            <v-spacer></v-spacer>

            <v-btn color="primary" dark class="mb-2" @click="dialog = true">
              CREAR Usuario
            </v-btn>

            <v-dialog v-model="dialogDelete" max-width="500px">
              <v-card>
                <v-card-title class="headline"
                  >Seguro de eliminar esto?</v-card-title
                >
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn color="blue darken-1" text @click="closeDelete"
                    >Cancel</v-btn
                  >
                  <v-btn color="blue darken-1" text @click="deleteItemConfirm"
                    >OK</v-btn
                  >
                  <v-spacer></v-spacer>
                </v-card-actions>
              </v-card>
            </v-dialog>
          </v-toolbar>
        </template>
        <template v-slot:item.actions="{ item }">
          <v-icon small class="mr-2" @click="editItem(item)">
            mdi-pencil
          </v-icon>
          <v-icon small @click="deleteItem(item)"> mdi-delete </v-icon>
        </template>
      </v-data-table>

      <v-dialog v-model="dialog">
        <v-card>
          <v-card-title>
            <span class="headline">User Profile</span>
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-row>
                <v-col cols="12" sm="6" md="4">
                  <v-text-field
                    label="Legal first name*"
                    required
                    v-model="editedItem.name"
                  ></v-text-field>
                </v-col>
                <v-col cols="12">
                  <v-text-field label="Email*" required></v-text-field>
                </v-col>

                <v-col cols="12" sm="6">
                  <v-select
                    :items="['Female', 'Male']"
                    label="Gender*"
                    required
                  ></v-select>
                </v-col>
                <v-col cols="12" sm="6">
                  <v-select
                    :items="['Active', 'Inactive']"
                    label="Satus*"
                    required
                  ></v-select>
                </v-col>
              </v-row>
            </v-container>
            <small>*indicates required field</small>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="blue darken-1" text @click="dialog = false">
              Close
            </v-btn>
            <v-btn color="blue darken-1" text @click="crearUsuario">
              Guardar
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-main>
  </v-app>
</template>

<script>
//import HelloWorld from './components/HelloWorld.vue'
import axios from "axios";

axios.defaults.headers.common = {
  Authorization:
    "Bearer e72a47899aa8b122b179105703357cb0ff794d2c27178fb236d702b1d47688ab",
};

export default {
  name: "App",
  data: function () {
    return {
      datos: [],
      dialog: false,
      dialogDelete: false,
      editedItem: {},
    };
  },
  async mounted() {
    try {
      const response = await axios.get("https://gorest.co.in/public-api/users");
      console.log(response);
      this.datos = response.data.data;
    } catch (error) {
      console.error(error);
    }
  },
  methods: {
    crearUsuario() {
      axios
        .post("https://gorest.co.in/public-api/users", this.editedItem)
        .then(function (response) {
          console.log(response);
          this.dialog = false;
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    actualizarUsuario(usuario) {
      axios
        .put("https://gorest.co.in/public-api/users/" + usuario.id, usuario)
        .then(function (response) {
          console.log(response);
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    eliminarUsuario(id) {
      axios
        .delete("https://gorest.co.in/public-api/users/" + id)
        .then(function (response) {
          console.log(response);
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    editItem(item) {
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },

    deleteItem(item) {
      this.editedItem = Object.assign({}, item);
      this.dialogDelete = true;
    },
    deleteItemConfirm() {
      this.eliminarUsuario(this.editedItem.id);
    },
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
button {
  font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
  flood-color: indigo;
  caret-color: lawngreen;
}
</style>
