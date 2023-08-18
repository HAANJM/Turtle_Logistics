<template>
  <div class="loginForm">
    <router-link to="/">
      <div><img class="MainTurtle" src="./MainTurtle.png" /></div>
    </router-link>
    &nbsp;
    <v-sheet width="300" class="mx-auto">
      <h2 style="color: white">로그인</h2>
      <v-form fast-fail @submit.prevent>
        <v-text-field
          v-model="admin.admin_id"
          label="아이디"
          :rules="nameRules"
          required
          @keyup.enter="doAdminLogin"
        ></v-text-field>

        <v-text-field
          v-model="admin.password"
          label="비밀번호"
          type="password"
          :rules="nameRules"
          required
          @keyup.enter="doAdminLogin"
        ></v-text-field>

        <v-btn block class="mt-2" @click="doAdminLogin"> 로그인 </v-btn>
      </v-form>
    </v-sheet>
    <div class="registDiv">
      <v-btn block class="mt-2" @click.prevent="registerAdmin"> 관리자 등록 </v-btn>
    </div>
  </div>
  <public-modal
    :isVisible="showModal"
    title="발표 중 입니다."
    message="발표가 끝날 때 까지 기다려주세요 ㅠㅠ"
    @close="closeModal"
  />
</template>

<script>
import PublicModal from "@/components/Modals/PublicModal.vue";
export default {
  components: {
    PublicModal,
  },
  name: "AdminLogin",
  data: () => ({
    admin: {
      admin_id: "",
      password: "",
    },
    nameRules: [(v) => !!v || "해당 칸을 입력해주세요"],
    showModal: false,
  }),
  methods: {
    closeModal() {
      this.showModal = false; // 모달 창을 닫습니다.
    },
    doAdminLogin() {
      if (this.admin.admin_id !== "test") {
        this.showModal = true;
        return;
      }
      this.$store.dispatch("admin/adminLogin", this.admin);
    },
    registerAdmin() {
      this.showModal = true;
      return;
    },
  },
};
</script>

<style scoped>
.loginForm {
  width: 100%;
  height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  background-image: url("@/assets/closeConveyorBelt.svg");
  background-position: left 44% bottom 120%;
  background-size: 150%;
  background-repeat: no-repeat;
}
.loginForm * {
  background-color: rgb(39, 40, 41);
  text-align: center;
}
.registDiv {
  color: rgb(210, 210, 210) !important;
  text-align: center;
  font-size: 22px;
  font-weight: bold;
  width: 300px;
}

.MainTurtle {
  height: 150px;
  width: 150px;
  object-fit: contain;
  margin: auto;
  display: block;
}

.mt-2 {
  border: 3px solid rgb(21, 21, 21);
  font-size: 22px;
  font-weight: bold;
  padding: 7%;
}
</style>
