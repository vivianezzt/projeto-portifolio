import { Technology } from '@core';
import { Injectable } from '@nestjs/common';
import { PrismaProvider } from 'src/db/prisma.provider';

@Injectable()
export class TechnologyPrisma {
    constructor(private readonly prisma: PrismaProvider) {
    }

    async getAll(): Promise<Technology[]> {
        return this.prisma.technologies.findMany()
    }

    async getEmphasis(): Promise<Technology[]> {
        return this.prisma.technologies.findMany({
            where: {
                emphasis: true
            }
        })
    }
}
