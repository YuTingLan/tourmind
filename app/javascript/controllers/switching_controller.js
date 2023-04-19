import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['rat', "openButton", "closeButton" ];

  connect() {
    this.ratTarget.hidden = true
    this.closeButtonTarget.hidden = true 
  }

  toggleDown(){
    if (this.ratTarget.hidden == true) {
      this.open()
    }else{
      this.close()
    }
  }

  open(){
     this.ratTarget.hidden = false
    this.openButtonTarget.hidden = true
    this.closeButtonTarget.hidden = false
  }
  close(){
    this.ratTarget.hidden = true
    this.openButtonTarget.hidden = false
    this.closeButtonTarget.hidden = true
  }
}