1) Iserire la Access-Key e Secret-key nel file aws-config.txt
2) Aprire una finestra in terminal e avviare il seguente comando: ruby swf_workflow.rb
3) Copiare l'id del workflow
4) Aprire una nuova finestra in terminal e avviare il seguente comando: 
    ruby swf_activities.rb <id-workflow> 
    per esempio ruby swf_activities.rb b30240c0-ba1a-4fb6-bf8e-1de175b23651-activities
5) Seguire le indicazioni a schermo
