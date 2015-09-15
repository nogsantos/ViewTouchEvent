//
//  CirculoViewController.m
//  ViewTouchEventEx1
//
//  Created by Fabricio Nogueira dos Santos on 9/15/15.
//  Copyright (c) 2015 Fabricio Nogueira. All rights reserved.
//

#import "CirculoViewController.h"

@interface CirculoViewController ()

@end

@implementation CirculoViewController

/**
 * Registra um log quando o usuário toca na tela.
 */
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    NSLog(@"Toque recebido...");
}
/**
 * Registra o ponto de toque quando o dedo for retirado.
 */
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    /*
     * Inicialização do arraymutable
     */
    if (!circulos) {
        circulos = [[NSMutableArray alloc]init];
    }
    NSLog(@"Retirada do toque.... Registrando o ponto de toque");
    /*
     * Recupera o objeto de toque em si
     * Retorne o UITouch mais conveniente
     */
    UITouch *toque           = [touches anyObject];
    /*
     * Recuperar em qual parte da tela o usuário colocou o dedo.
     * recebe uma outra view como parametro, no caso, a própria view e retorna 
     * uma struct do tipo CGPoint com a posição convertida para o sistema de coordenadas da view.
     */
    CGPoint localizacaoToque = [toque locationInView:self];
    /*
     * Encapsulando o CGPoint dentro de um NSValue
     * o CGPoint não é um objeto propriamente dito
     */
    [circulos addObject:[NSValue valueWithCGPoint:localizacaoToque]];
    
    [self setNeedsDisplay];
}
/**
 * Método responsável por realizar as tarefas de desenho na tela
 */
-(void) drawRect:(CGRect)rect{
    /*
     * Contexto atual
     */
    CGContextRef contexto = UIGraphicsGetCurrentContext();
    /*
     * Tamanho da linha
     */
    CGContextSetLineWidth(contexto, 1.0);
    /*
     * Cor de fundo
     */
    CGColorRef corFundo = [UIColor redColor].CGColor;
    /*
     * Preenchimento
     */
    CGContextSetFillColor(contexto, CGColorGetComponents(corFundo));
    /*
     *
     */
    int tamanho = 25;
    /*
     * intera por todos os pontos de toque registrados no método touchesEnded, 
     * desenhado os círculos na tela
     */
    for (NSValue *item in circulos) {
        /*
         * recupera o valor do CGPoint adicionado quando o usuário 
         * interagiu com o aplicativo
         */
        CGPoint ponto = [item CGPointValue];
        /*
         * define a área do cículo
         */
        CGRect regiao = CGRectMake(ponto.x, ponto.y, tamanho, tamanho);
        /*
         * pinta o círculo na tela
         */
        CGContextAddEllipseInRect(contexto, regiao);
        CGContextFillEllipseInRect(contexto, regiao);
    }
    /*
     *
     */
    CGContextStrokePath(contexto);
}

@end
























