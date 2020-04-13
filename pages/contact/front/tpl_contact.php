<?php $this->insert('common/front/_tpl_header') ?>

<div class="row">
    <form class="col s12">

    <div class="row">
      <h4 class="input-field offset-s2 col s6">Nous conctater</h4>
    </div>
    <!-- Input first name -->
      <div class="row">
        <div class="input-field offset-s1 col s2">
          <input id="first_name" type="text">
          <label for="first_name">First Name</label>
        </div>
      </div>
      <!-- Input last name -->
      <div class="row">
        <div class="input-field offset-s1 col s2">
          <input id="last_name" type="text">
          <label for="last_name">Last Name</label>
        </div>
      </div>
      <!-- Input email -->
      <div class="row">
        <div class="input-field offset-s1 col s2">
          <input id="email" type="email">
          <label for="email">Email</label>
        </div>
      </div>
      <!-- Input message -->
      <div class="row">
        <div class="input-field offset-s1 col s8">
            <input id="msg" type="text"></input>
            <label for="msg">Message</label>
        </div>
      </div>
        <!-- Input button send -->
        <div class="row">
          <div class="input-field offset-s1 col s3">
            <button class="btn waves-effect waves-light" id="btn" type="submit" name="action">Envoyer</button>
          </div>
        </div>
      </div>
    </form>
  </div>
  
  <script src="<?php echo $this->versionized('pages/contact/front/script/contact.js')?>" type="text/javascript"></script>

<?php $this->insert('common/front/_tpl_footer') ?>