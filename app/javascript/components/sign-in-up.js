const loadDynamicSignInUp = () => {
  const signUpButton = $('#signUp');
  const signInButton = $('#signIn');
  const container = $('#container');
  
  // signUpButton.addEventListener('click', () => {
  //     container.classList.add('right-panel-active');
  // });
    signUpButton.click(() => {
       $( container ).addClass('right-panel-active');
     });

  // signInButton.addEventListener('click', () => {
  //     container.classList.remove('right-panel-active');
  // });
  signInButton.click(() => {
    $( container ).removeClass('right-panel-active');
  });
}

export { loadDynamicSignInUp };
