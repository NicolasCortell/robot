<?php $this->insert('common/front/_tpl_header') ?>

<div class="container">
  <form id="form" action ="javascript:alert('envoyé');" method="post" class="container">
        <div id="input">
        <label for="name">Nom et prénom</label>
        <input id="name" type="text">

        <label for="email">Email</label>
        <input id="email" type="email">

        <label for="msg">Message</label>
        <input id="msg" type="textarea"></input>

        <input id="btn" type="submit" value="Envoyer"></input>
        </div>
  </form>
</div>
<script src="<?php echo $this->versionized('pages/contact/front/script/contact.js')?>" type="text/javascript"></script>

<?php $this->insert('common/front/_tpl_footer') ?>