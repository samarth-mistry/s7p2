# Generated by Django 4.0.1 on 2022-07-19 07:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_super_admin'),
    ]

    operations = [
        migrations.AlterField(
            model_name='super_admin',
            name='name',
            field=models.CharField(max_length=70),
        ),
    ]