#import <Foundation/Foundation.h>

// Clase Articulo
@interface Articulo : NSObject {
    NSString *_nombre;       // Variables de instancia
    NSInteger _cantidad;
    double _precio;
}

@property (nonatomic, retain) NSString *nombre;
@property (nonatomic) NSInteger cantidad;
@property (nonatomic) double precio;

- (instancetype)initWithNombre:(NSString *)nombre cantidad:(NSInteger)cantidad precio:(double)precio;
- (NSString *)descripcion;
@end

@implementation Articulo

// Implementación manual del getter y setter para la propiedad 'nombre'
- (NSString *)nombre {
    return _nombre;
}

- (void)setNombre:(NSString *)nombre {
    if (_nombre != nombre) {
        [_nombre release];
        _nombre = [nombre retain];  // Usamos 'retain' en lugar de ARC
    }
}

// Implementación manual del getter y setter para la propiedad 'cantidad'
- (NSInteger)cantidad {
    return _cantidad;
}

- (void)setCantidad:(NSInteger)cantidad {
    _cantidad = cantidad;
}

// Implementación manual del getter y setter para la propiedad 'precio'
- (double)precio {
    return _precio;
}

- (void)setPrecio:(double)precio {
    _precio = precio;
}

- (instancetype)initWithNombre:(NSString *)nombre cantidad:(NSInteger)cantidad precio:(double)precio {
    self = [super init];
    if (self) {
        _nombre = [nombre retain];
        _cantidad = cantidad;
        _precio = precio;
    }
    return self;
}

- (NSString *)descripcion {
    return [NSString stringWithFormat:@"Nombre: %@, Cantidad: %ld, Precio: %.2f", self.nombre, (long)self.cantidad, self.precio];
}

- (void)dealloc {
    [_nombre release];
    [super dealloc];
}

@end

// Clase Inventario
@interface Inventario : NSObject {
    NSMutableArray *_articulos;  // Variables de instancia
}

@property (nonatomic, retain) NSMutableArray *articulos;

- (void)agregarArticulo:(Articulo *)articulo;
- (void)mostrarInventario;
@end

@implementation Inventario

// Implementación manual del getter y setter para la propiedad 'articulos'
- (NSMutableArray *)articulos {
    return _articulos;
}

- (void)setArticulos:(NSMutableArray *)articulos {
    if (_articulos != articulos) {
        [_articulos release];
        _articulos = [articulos retain];
    }
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _articulos = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)agregarArticulo:(Articulo *)articulo {
    [self.articulos addObject:articulo];
}

- (void)mostrarInventario {
    NSLog(@"Inventario:");
    for (Articulo *articulo in self.articulos) {
        NSLog(@"%@", [articulo descripcion]);
    }
}

- (void)dealloc {
    [_articulos release];
    [super dealloc];
}

@end

int main(int argc, const char * argv[]) {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];  // Manejo manual del pool de memoria
    
    Inventario *inventario = [[Inventario alloc] init];
    
    Articulo *articulo1 = [[Articulo alloc] initWithNombre:@"Laptop" cantidad:10 precio:999.99];
    Articulo *articulo2 = [[Articulo alloc] initWithNombre:@"Mouse" cantidad:50 precio:19.99];
    
    [inventario agregarArticulo:articulo1];
    [inventario agregarArticulo:articulo2];
    
    [inventario mostrarInventario];
    
    [articulo1 release];
    [articulo2 release];
    [inventario release];
    
    [pool drain];  // Liberamos el NSAutoreleasePool
    
    return 0;
}
