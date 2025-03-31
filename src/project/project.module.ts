import { Module } from '@nestjs/common';
import { ProjectPrisma } from './project.prisma';
import { ProjectController } from './project.controller';
import { DbModule } from 'src/db/db.module';

@Module({
  imports: [DbModule],
  providers: [ProjectPrisma],
  controllers: [ProjectController], 
})
export class ProjectModule {}
