<?php $this->insert('common/front/_tpl_header') ?>
<!--
<p id="user"><?= $nom . " " . $prenom ?></p>

<table>
    <thead>
        <?php foreach ( $tests as $test ) : ?>
        <th id='<?=$test['code']?>'><?=$test['code']?></th>
        <?php endforeach; ?>
    </thead>
</table>

<div id='customer'></div>


<script src="<?php echo $this->versionized('pages/home/front/script/home.js')?>" type="text/javascript"></script>
-->

<?php $this->insert('common/front/_tpl_footer') ?>