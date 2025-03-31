import { Controller, Get } from '@nestjs/common';
import { Technology } from '@core';
import { TechnologyPrisma } from './technology.prisma';

@Controller('technologies')
export class TechnologyController {
    constructor(private readonly repo: TechnologyPrisma) { }
    @Get()
    async getAllTechnologies(): Promise<Technology[]> {
        return this.repo.getAll();
    }
    @Get('emphasis')
    async getEmphasisTechnologies(): Promise<Technology[]> {
        return this.repo.getEmphasis();
    }
}
