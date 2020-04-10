<?php $this->insert('common/front/_tpl_header') ?>

<table>
    <thead>
        <?php foreach ( $tests as $test ) : ?>
            <th><?=$test['code']?></th>
        <?php endforeach; ?>
    </thead>
</table>

<script src="<?php echo $this->versionized('pages/home/front/script/home.js')?>" type="text/javascript"></script>

<?php $this->insert('common/front/_tpl_footer') ?>