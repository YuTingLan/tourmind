import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

export default class extends Controller {

  initialize() {
    this.message = ''
    this.type = ''
  }

  connect() {
    const { message, type } = this.element.dataset
      const Toast = Swal.mixin({
        toast: true,
        position: 'top-end',
          customClass: {
            container: 'flash_style'
          },
        showConfirmButton: false,
        timer: 2000,
        timerProgressBar: true,
        didOpen: (toast) => {
          toast.addEventListener('mouseenter', Swal.stopTimer)
          toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
      })
      console.log(type)
      if(type == 'notice'){
        Toast.fire({
          icon: 'success',
          title: message
        })
      }
      else{
        Toast.fire({
          icon: 'error',
          title: message
        })
      }
  }
}