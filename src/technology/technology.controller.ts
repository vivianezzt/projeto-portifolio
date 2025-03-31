import { Controller, Get } from '@nestjs/common';
import { Technology } from '@core';
import { TechnologyProvider } from './technology.provider';

@Controller('technologies')
export class TechnologyController {
    constructor(private readonly repo: TechnologyProvider) {}
    @Get()
    async getAllTechnologies(): Promise<Technology[]> {
        return this.repo.getAll();
    }
}
