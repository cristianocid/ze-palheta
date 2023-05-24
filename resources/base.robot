*** Settings ***
Library    SeleniumLibrary
Library    libs/db.py

Resource   kws.robot
Resource   hooks.robot
Resource   pages/LoginPage.robot
Resource   components/Sidebar.robot
Resource   pages/CustomersPage.robot
Resource   components/Toaster.robot

*** Variables ***
${base_url}          http://zepalheta-web:3000 
${admin_user}        admin@zepalheta.com.br  
${admin_password}    pwd123