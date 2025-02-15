import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 650
    height: 450
    title: "🛒 Carrito de Compras"

    ListModel {
        id: productosDisponibles
        ListElement { nombre: "Laptop"; precio: 1200 }
        ListElement { nombre: "Mouse"; precio: 25 }
        ListElement { nombre: "Teclado"; precio: 45 }
        ListElement { nombre: "Monitor"; precio: 300 }

    }

       ListModel {
           id: carritoCompras
       }

       Column {
           spacing: 10
           anchors.centerIn: parent

           Row {
               spacing: 20

               // Lista de productos
               ListView {
                   id: listaProductos
                   width: 250
                   height: 250
                   model: productosDisponibles
                   delegate: Item {
                       width: 250
                       height: 40

                       Row {
                           spacing: 10
                           Text { text: nombre }
                           Text { text: "$" + precio }
                           Button {
                               text: "+"
                               onClicked: {
                                   carritoCompras.append({ nombre: nombre, precio: precio })
                               }
                           }
                       }
                   }
               }
           }
       }
}
