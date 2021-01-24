$(document).ready(function() {
    $('#example').DataTable({
        language: {
            searchPlaceholder: 'Search records',
            sSearch: '',
            sLengthMenu: 'Show _MENU_',
            sLength: 'dataTables_length',
            oPaginate: {
                sFirst: '<i class="material-icons"></i>',
                sPrevious: '<i class="material-icons"></i>',
                sNext: '<i class="material-icons"></i>',
                sLast: '<i class="material-icons"></i>' 
        }
        }
    });
    $('.dataTables_length select').addClass('browser-default');
});