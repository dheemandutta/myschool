function validate() {
    var myForm = $('#MyForm');
    if (myForm.parsley().validate()) {
        return true;
    }
    else {
        return false;
    }
}
