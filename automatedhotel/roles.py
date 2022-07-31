from rolepermissions.roles import AbstractUserRole

class SuperAdministrator(AbstractUserRole):
    available_permissions = {
        'dashboard': True,
    }

class HotelOwner(AbstractUserRole):
    available_permissions = {
        'hotel_dashboard': True,
    }

class HotelTable(AbstractUserRole):
    available_permissions = {
        'table_menu': True,
    }